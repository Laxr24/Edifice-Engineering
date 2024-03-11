// Global vars

const uName = document.getElementById("uname")
const uPass = document.getElementById("pass")
const logInBtn = document.getElementById("loginBtn")


const pubUrl = "http://103.73.226.60:8000/data/config.json"; 
const locUrl = "http://127.0.0.1:5500/data/config.json"

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

    fetch(locUrl).then((res)=>{
        console.log(res)       
    }).catch(e=> console.log(e)); 



}



// SnackBar
function showSnackbar() {
    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}