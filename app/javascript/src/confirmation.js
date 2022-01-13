import Rails from "@rails/ujs"

Rails.confirm = function(message, element) {
  let $element = $(element)
  let $dialog = $('#confirmation-modal')
  let $content = $dialog.find('#modal-content')
  let $ok = $dialog.find('#ok-button')
  $content.text(message)
  $ok.click(function(event) {
      event.preventDefault()
      $dialog.modal("hide")
      let old = Rails.confirm
      Rails.confirm = function() { return true }
      $element.get(0).click()
      Rails.confirm = old
    })
  $dialog.modal("show")
  return false;
}
