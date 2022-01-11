import Cookies from 'js-cookie';

const cookieName = "dark-theme";
const darkTheme = 1;
const lightTheme = 0;

document.addEventListener("turbolinks:load", () => {
  let theme = Cookies.get(cookieName);

  if (theme === undefined) {
    Cookies.set(cookieName, darkTheme);
  } else if (theme == darkTheme) {
    setTheme(darkTheme);
    $("#js-theme-switch").click();
  } else {
    setTheme(lightTheme);
  }

  $("#js-theme-switch").change(function() {
    if ($(this).prop("checked")) { // Dark mode
      Cookies.set(cookieName, darkTheme);
      setTheme(darkTheme);
    } else { // Light mode
      Cookies.set(cookieName, lightTheme);
      setTheme(lightTheme);
    }
  });
})

function setTheme(themeNum) {
  $("body").removeClass("light-theme");

  if (themeNum === lightTheme) {
    $("body").addClass("light-theme");
  }
}
