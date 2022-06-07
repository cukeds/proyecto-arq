
function cookie(id, names){
  let tobehidden = document.getElementsByClassName("tbh");
  [].forEach.call(tobehidden, function(tbh){
    tbh.classList.add("hidden");
  });

  let tobechanged = document.getElementsByClassName("tbc");
  let i = 0;
  [].forEach.call(tobechanged, function(tbc){
    tbc.innerText = names[tbc.htmlFor];
  });

  document.getElementById('logout').classList.remove("hidden");
}

function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}

function listCookies() {
    var theCookies = document.cookie.split(';');
    var aString = '';
    for (var i = 1 ; i <= theCookies.length; i++) {
        aString += i + ' ' + theCookies[i-1] + "\n";
    }
    return aString;
}