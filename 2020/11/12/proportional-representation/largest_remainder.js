(function(){
    const hare = (p, s) => 1.*p/s
    const droop = (p, s) => 1.*p/(s+1)
    const imperiali =  (p, s) => 1.*p/(s+2)

    function calc(seats, votes, method){
        const p = votes.reduce((sum, x) => sum+x)
        const q = method(p,seats)
        const rd1 = votes.map((x) => Math.floor(x/q))
        const remainder = rd1.map((x,i) => votes[i] - x*q)

        const rs = seats - rd1.reduce((sum, x) => sum+x)  // 剩余席位
        // imperiali 可能出现第一轮分配席位超过总席位，余数最小的剔除一席（未经验证是否会破坏 quota rule 的个人 fix）
        const rd2 = round2(rs,remainder)
        const result = rs >= 0 ? rd1.map((x,i) => rd2[i]+x) : rd1.map((x,i) => x - rd2[i])
        return {
            "quota":q,
            "votes":votes,
            "round1":rd1,
            "remain":remainder,
            "round2":rd2,
            "result":result
        }
    }

    function round2(rs, remainder){
        const a = Array(Math.abs(rs)).fill(-1)
        // imperiali 可能出现第一轮分配席位超过总席位
        const compare = rs >= 0 ? (a,b) => a > b : (a,b) => a < b
        for(const [i,x] of remainder.entries()){
            for(const [j,y] of a.entries()){
                if(y == -1 || compare(x,remainder[y])){
                    let k = a.length - 1
                    while(k > j){
                        a[k] = a[k - 1]
                        k-=1
                    }
                    a[j] = i
                    break;
                }
            }
        }
        return remainder.map((x, i) => a.includes(i) ? 1 : 0)
    }


    function generate_html(parent, result, axis=0) {
        while (parent.firstChild) {
            parent.removeChild(parent.firstChild);
        }
        const tbl = document.createElement("table")
        const tblBody = document.createElement("tbody")

        const set = [['票数','votes'],['第一轮','round1'],['余数','remain'],['第二轮','round2'],['结果','result']]

        text  = document.createElement("div")
        text.innerText = "数额：" + result["quota"]
        parent.appendChild(text)
        if(axis == 0){
            for(let i = -1; i<result["votes"].length; i++){
                let row = document.createElement("tr")
                if( i == -1){
                    for (const [,[label, ]]  of set.entries()){
                        let cell = document.createElement("td");
                        let cellText = document.createTextNode(label)
                        cell.appendChild(cellText)
                        row.appendChild(cell)
                    }
                }else{
                    for (const [,[, idx]]  of set.entries()){
                        let cell = document.createElement("td");
                        let cellText = document.createTextNode(result[idx][i])
                        cell.appendChild(cellText)
                        row.appendChild(cell)
                    }
                }
                tblBody.appendChild(row)
            }
        }else{
            for (const [,[label, idx]]  of set.entries()){
                let row = document.createElement("tr")
                let cell = document.createElement("td");
                let cellText = document.createTextNode(label)
                cell.appendChild(cellText)
                row.appendChild(cell)
                for(const v of result[idx].entries()){
                    cell = document.createElement("td")
                    cellText = document.createTextNode(v[1])
                    cell.appendChild(cellText)
                    row.appendChild(cell)
                }
                tblBody.appendChild(row)
            }
        }



        tbl.appendChild(tblBody)
        tbl.setAttribute("border", "2")
        parent.appendChild(tbl)
    }

    window.calcLRM = function(parent, seats, votes, method){
        let axis = 0
        const result = calc(seats, votes, eval(method))
        generate_html(parent,result,axis)
        const btn = document.getElementById("axis")
        btn.onclick= function(){
            if(axis==0){
                axis = 1
            }else{
                axis = 0
            }
            generate_html(parent, result, axis)
        }
    }
})()
