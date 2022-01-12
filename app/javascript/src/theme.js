import Cookies from 'js-cookie';

document.addEventListener("turbolinks:load", () => {
  const cookieName = "light-theme";
  const isLightThemeOn = Cookies.get(cookieName) === 'true';
  const $switch = $("#js-theme-switch");

  $switch.change(function() {
    let isOn = $(this).prop("checked")

    $("body").toggleClass("light-theme", isOn);
    Cookies.set(cookieName, isOn, { expires: 365 });
  });

  $switch
    .prop("checked", isLightThemeOn)
    .trigger("change");
})
