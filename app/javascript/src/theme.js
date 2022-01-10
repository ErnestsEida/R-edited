const cookieName = "dark-theme";
const darkTheme = 1;
const lightTheme = 0;

document.addEventListener("turbolinks:load", () => {
  let theme = getCookie();

  if (theme === null) {
    setCookie(darkTheme);
  } else if (theme == darkTheme) {
    setTheme(darkTheme);
    $("#themeSwitch").click();
  } else {
    setTheme(lightTheme);
  }

  $("#themeSwitch").click(function() {
    if ($(this).prop("checked")) { // Dark mode
      setCookie(darkTheme);
      setTheme(darkTheme);
    } else { // Light mode
      setCookie(lightTheme);
      setTheme(lightTheme);
    }
  });
})

function getCookie() {
  let allCookies = document.cookie;
  let splitCookies = allCookies.split(";");

  for (let cookie of splitCookies){
    if (cookie.includes(cookieName)) {
      let value = cookie.split("=")[1];
      return value;
    }
  }

  return null;
}

function setCookie(state) {
  let expDate = new Date();
  let year = expDate.getFullYear();
  expDate.setFullYear(year + (2037 - year));
  let newCookieString = cookieName + "=" + state + ";" + "expires=" + expDate.toUTCString();
  document.cookie = newCookieString;
}

function setTheme(themeNum) {
  $("body").removeClass();
  
  if (themeNum === lightTheme) {
    $("body").addClass("light-theme");
  }
}
