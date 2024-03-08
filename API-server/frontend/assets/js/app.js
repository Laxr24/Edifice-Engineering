// Global vars

const uName = document.getElementById("uname")
const uPass = document.getElementById("pass")
const logInBtn = document.getElementById("loginBtn")


loginBtn.onclick = checkInput; 

function checkInput(){
    let _uName, _uPass; 
    if(uName.value != "" && uPass.value != ""){
        _uName = uName.value; 
        _uPass = uPass.value; 
    }else{
        alert("You are not authorized :( ")
    }

    authorize(_uName, _uPass)

    
}

function authorize(_uName, _uPass){
    if(_uName == 'shaan' && _uPass == 'shan'){
        window.location = 'dashboard.html'
    }else{
        showSnackbar(); 
    }
}



// SnackBar
function showSnackbar() {
    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}