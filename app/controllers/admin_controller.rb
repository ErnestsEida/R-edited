class AdminController < ApplicationController
  before_action :authenticate_user!, :authorize_user
  after_action :verify_authorized
  skip_before_action :verify_authenticity_token, only: [:send_newspost_message]

  def dashboard
  end

  def users
    @users = User.all.where(admin: false).order(:id).page(params[:page]).per(20)
  end

  def homepage
    @homepage = Homepage.first
    @feedback = Feedback.new
  end

  def token_packs
    @token_packs = TokenPack.all.order(:price)
    @token_pack = TokenPack.new
  end

  def awards
    @awards = Award.all.order(:value)
    @award = Award.new
  end

  def subscribers
    @all_subscribers = User.where(subscribed_to_news: true)
    @subscribers = @all_subscribers.page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.xlsx {
        workbook = RubyXL::Workbook.new
        worksheet = workbook[0]
        worksheet.sheet_name = "Subscribers"
        worksheet.add_cell(0, 0, "ID")
        worksheet.add_cell(0, 1, "USERNAME")
        worksheet.add_cell(0, 2, "EMAIL")
        @all_subscribers.each_with_index do |subscriber, index|
            worksheet.add_cell((index + 1), 0, subscriber.id)
            worksheet.add_cell((index + 1), 1, subscriber.username)
            worksheet.add_cell((index + 1), 2, subscriber.email)
        end
        send_data workbook.stream.string, filename: "subscribers.xlsx", disposition: 'attachment'
      }
    end
  end

  def recent_events
    @recent_event = RecentEvent.new
  end

  def send_newspost_message
    event = RecentEvent.find(params[:event_id])
    User.where(subscribed_to_news: true).each do |subscriber|
      UserMailer.with(user: subscriber, post: event).new_post_in_news.deliver_now
    end
  end

  private

  def authorize_user
    authorize :admin
  end

end
