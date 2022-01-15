function namevalidation(idname, idmsg, errMsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (e.value.length != 0) {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    } else if (e.value.length > 50) {
        m.innerHTML = "Max Length 50!";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    } else {
        m.innerHTML = errMsg;
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
}

function emailvalidation(idname, idmsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);
    console.log(e.value);

    var regem = /^([a-z 0-9\.-]+)@([a-z0-9-]+).([a-z]{2,8})(.[a-z]{2,8})$/;
    if (regem.test(e.value)) {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    }
    else {
        m.innerHTML = "Enter a valid E-mail";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
}

function datevalidation(idname, idmsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (e.value == "") {
        m.innerHTML = "Enter valid Date!";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
    else {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    }
}

function timevalidation(idname, idmsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (e.value == "") {
        m.innerHTML = "Enter valid Time!";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
    else {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    }
}

function idvalidation(idname, idmsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (e.value.length == 4 && e.value > 0) {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    }
    else {
        m.innerHTML = "Enter valid ID!";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
}

function numbervalidation(idname, idmsg, errMsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (e.value > 0) {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    }
    else {
        m.innerHTML = errMsg;
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
}

function mobilevalidation(idname, idmsg) {
    var e = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (e.value.length == 10) {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname);
        return true;
    }
    else {
        m.innerHTML = "Enter valid Mobile No.";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
}

function passwordvalidation(idname, idmsg) {
    var p = document.getElementById(idname);
    var m = document.getElementById(idmsg);

    if (p.value.length < 8) {
        m.innerHTML = "Enter atleast 8 Characters !";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
    else if (p.value.length > 16) {
        m.innerHTML = "Maximum 16 Characters !";
        m.style.visibility = "visible";
        redcolor(idname);
        return false;
    }
    else {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname)
        return true;
    }
    return true;
}

function cpasswordvalidation(idname, idname2, idmsg) {
    var p = document.getElementById(idname);
    var cp = document.getElementById(idname2);
    var m = document.getElementById(idmsg);

    if (p.value == cp.value) {
        m.innerHTML = "&nbsp;";
        m.style.visibility = "Hidden";
        blackcolor(idname2);
        return true;
    } else {
        m.innerHTML = "Password do not Match!";
        m.style.visibility = "visible";
        redcolor(idname2);
        return false;
    }
}

function userLoginValidate(idt1, idmsg1, idt2, idmsg2) {
    if (idvalidation(idt1, idmsg1) && passwordvalidation(idt2, idmsg2))
        return true;
    return false;
}

function studentRegisterValidate(idt1, idmsg1, errmsg1, idt2, idmsg2, idt3, idmsg3, idt4, idmsg4, idt5, idmsg5, idt6, idmsg6, idt7, idmsg7, errmsg7, idt8, idmsg8, errmsg8) {
    if (namevalidation(idt1, idmsg1, errmsg1) &&
        emailvalidation(idt2, idmsg2) &&
        mobilevalidation(idt3, idmsg3) &&
        passwordvalidation(idt4, idmsg4) &&
        cpasswordvalidation(idt4, idt5, idmsg5) &&
        datevalidation(idt6, idmsg6) &&
        numbervalidation(idt7, idmsg7, errmsg7) &&
        numbervalidation(idt8, idmsg8, errmsg8) )
            return true;
    return false;
}

function teacherRegisterValidate(idt1, idmsg1, errmsg1, idt2, idmsg2, idt3, idmsg3, idt4, idmsg4, idt5, idmsg5) {
    if (namevalidation(idt1, idmsg1, errmsg1) &&
        emailvalidation(idt2, idmsg2) &&
        mobilevalidation(idt3, idmsg3) &&
        passwordvalidation(idt4, idmsg4) &&
        cpasswordvalidation(idt4, idt5, idmsg5) )
            return true;
    return false;
}

function examRegisterValidate(idt1, idmsg1, errmsg1, idt2, idmsg2, idt3, idmsg3, idt4, idmsg4, errmsg4, idt5, idmsg5, errmsg5, idt6, idmsg6, errmsg6, idt7, idmsg7, errmsg7) {
    if (namevalidation(idt1, idmsg1, errmsg1) &&
        datevalidation(idt2, idmsg2) &&
        timevalidation(idt3, idmsg3) &&
        numbervalidation(idt4, idmsg4, errmsg4) &&
        numbervalidation(idt5, idmsg5, errmsg5) &&
        numbervalidation(idt6, idmsg6, errmsg6) &&
        numbervalidation(idt7, idmsg7, errmsg7))
        return true;
    return false;
}

function addQuestionValidate(idt1, idmsg1, errmsg1, idt2, idmsg2, errmsg2, idt3, idmsg3, errmsg3, idt4, idmsg4, errmsg4, idt5, idmsg5, errmsg5) {
    if (namevalidation(idt1, idmsg1, errmsg1) &&
        namevalidation(idt2, idmsg2, errmsg2) &&
        namevalidation(idt3, idmsg3, errmsg3) &&
        namevalidation(idt4, idmsg4, errmsg4) &&
        namevalidation(idt5, idmsg5, errmsg5))
        return true;
    return false;
}

function redcolor(str) {
    document.getElementById(str).style = "border: 3px solid red !important;";
}

function blackcolor(str) {
    document.getElementById(str).style = "border: 3px solid black !important;";
}