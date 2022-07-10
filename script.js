let heads = 0;
let tails = 0;
let coin = document.querySelector(".coin");
let flipBtn = document.querySelector("#flip-button");
let resetBtn = document.querySelector("#reset-button");

let headsBtn = document.querySelector("#heads-button");
let tailsBtn = document.querySelector("#tails-button");

let side = 1;
let totalBet = 25;
let possibleBets = [25, 250, 500, 750, 3000, 6000];
let i = 0;

flipBtn.addEventListener("click", () => {
    // 0 = Heads
    // 1 = Tails
    flipBtn.disabled = true;
    flipBtn.innerHTML = 'Flipping..';

    headsBtn.disabled = true;
    tailsBtn.disabled = true;

    console.log(totalBet)
    i = httpGet("./flip.php?bet=" + totalBet.toString() + "&side="+side);
    console.log(i);

    if(i == "NOT ENOUGH CREDITS!"){
        document.querySelector("#message").textContent = `NOT ENOUGH CREDITS!`;
        document.querySelector("#message").style.color = `#fff`;
        document.querySelector("#message").style.display = `block`;

        flipBtn.innerHTML = 'Flip Chip';
        flipBtn.disabled = false;

        return;
    }

    let flipPaths = ['./flip.mp3']
    let flipAudio = new Audio(flipPaths[Math.floor(Math.random() * flipPaths.length)]);
    flipAudio.volume = 0.5;
    flipAudio.play();

    coin.style.animation = "none";
    if(i == 1){
        console.log("AA");
        setTimeout(function(){
            coin.style.animation = "spin-heads 3s forwards";
        }, 100);
        heads++;
    } else{
        console.log("BB");
        setTimeout(function(){
            coin.style.animation = "spin-tails 3s forwards";
        }, 100);
        tails++;
    }
    setTimeout(updateStats, 3000);
    disableButton();
});
function updateStats(){
    document.querySelector("#heads-count").textContent = `Phant: ${heads}`;
    document.querySelector("#tails-count").textContent = `Project: ${tails}`;
}
function disableButton(){

    setTimeout(function(){
        flipBtn.innerHTML = 'Flip Chip';
        flipBtn.disabled = false;

        headsBtn.disabled = false;
        tailsBtn.disabled = false;

        window.parent.updateCredits();

        if(i == side){
            document.querySelector("#message").textContent = `YOU WON!`;
            document.querySelector("#message").style.color = `limegreen`;
            document.querySelector("#message").style.display = `block`;

            let winPaths = ['./win.wav']
            let winAudio = new Audio(winPaths[Math.floor(Math.random() * winPaths.length)]);
            winAudio.volume = 0.1;
            winAudio.play();

            party.confetti(document.querySelector("#message"), {
                count: party.variation.range(20, 40),
                size: party.variation.range(0.8, 1.2),
            });
        }else{
            document.querySelector("#message").textContent = `YOU LOST ${totalBet} CREDITS!`;
            document.querySelector("#message").style.color = `red`;
            document.querySelector("#message").style.display = `block`;
        }

    },3000);
}
/*resetBtn.addEventListener("click",() => {
    coin.style.animation = "none";
    heads = 0;
    tails = 0;
    updateStats();
});*/

document.querySelector("#heads-button").addEventListener("click",() => {
    side = 1;
    document.querySelector("#heads-button").classList.add('selected-button');
    document.querySelector("#tails-button").classList.remove('selected-button');
});

document.querySelector("#tails-button").addEventListener("click",() => {
    side = 0;
    document.querySelector("#tails-button").classList.add('selected-button');
    document.querySelector("#heads-button").classList.remove('selected-button');
});

function httpGet(theUrl) {
    let xmlHttpReq = new XMLHttpRequest();
    xmlHttpReq.open("GET", theUrl, false);
    xmlHttpReq.send(null);
    return xmlHttpReq.responseText;
}

function selectBet(bet){
    totalBet = bet;
    
    possibleBets.forEach(function(v){
        document.querySelector("#btn-"+v.toString()).classList.remove('selected-button');
    });
    document.querySelector("#btn-"+bet.toString()).classList.add('selected-button');
}