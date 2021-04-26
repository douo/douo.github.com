function doCal(){

    const seats = Number.parseInt(document.getElementById('seats').value)
    const votes = document.getElementById('votes').value.split(',').map(x => Number.parseInt(x))
    const method = document.getElementById('method').value

    const lrm = document.getElementById('main').value=="1" ? false : true

    const parent = document.getElementById("display")

    if(lrm){
        window.calcLRM(parent, seats, votes, method)
    }else{
        window.calcHAM(parent, seats, votes, method)
    }
}

function init(){
    const queryString = window.location.search
    const urlParams = new URLSearchParams(queryString)
    const seats = urlParams.get('seats')
    const votes = urlParams.get('votes')
    const method = urlParams.get('method')
    const main = urlParams.get('main')

    const eleMain = document.getElementById('main')
    const eleLrm = document.getElementById('method')
    const eleHam = document.getElementById('d-method')
    eleHam.id='method'
    const anchor = document.getElementById('anchor')
    const form = eleMain.parentElement

    toggleMain = function(nv){
        if(form.contains(eleHam)) form.removeChild(eleHam)
        if(form.contains(eleLrm)) form.removeChild(eleLrm)
        if(nv=="0"){
            form.insertBefore(eleLrm,anchor)
             document.getElementById("axis").style.display=""
        }else{
            form.insertBefore(eleHam,anchor)
            document.getElementById("axis").style.display="none"
        }

    }

    eleMain.addEventListener('change', (event) =>{
        toggleMain(event.target.value)
    })

    main !=null ? document.getElementById('main').value = main  : document.getElementById('seats').value ="0"
    toggleMain( document.getElementById('main').value)
    if(seats !=null) document.getElementById('seats').value = seats
    if(votes !=null) document.getElementById('votes').value = votes
    if(method !=null) document.getElementById('method').value = method
    if(urlParams.has("calc")){
        doCal()
    }
}

init()
