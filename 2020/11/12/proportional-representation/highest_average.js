(function (){
    const dHondt = (s) => s+1
    const sLague = (s) => s*2+1
    const imperiali = (s) => (s+2)/2
    const modSLague = (s) => s==0?1:(2*s+1)*5/7

    class Candidate{
        constructor(vote, idx, method){
            this.vote = vote
            this.idx = idx
            this.method = method
            this.seats = 0
        }

        get weight(){
            return this.vote/this.method(this.seats)
        }
    }

    function calc(seats, votes, method){
        candidates = votes.map((v,i) => new Candidate(v, i, method))
        candidates.sort((f, s) => s.weight - f.weight)
        for(let i = 0 ; i< seats ; i++){
            const elected = candidates[0]
            // 为当前轮获得席位的候选人更新权重，并重新排序到合适位置，确保列表保持有序
            elected.seats += 1
            let i = 1
            while(i < candidates.length && candidates[i].weight>elected.weight){
                candidates[i-1] = candidates[i]
                i++
            }
            candidates[i-1] = elected
        }
        candidates.sort((f, s) => f.idx - s.idx)
        return candidates
    }


    function generate_html(parent, result, method) {
        while (parent.firstChild) {
            parent.removeChild(parent.firstChild);
        }
        const tbl = document.createElement("table")
        const tblBody = document.createElement("tbody")

        const max = result.reduce((max, candidate) => candidate.seats > max ? candidate.seats : max, 0)
        let row = document.createElement("tr")
        let cell = document.createElement("td");
        let cellText = document.createTextNode("除数/总数")
        cell.appendChild(cellText)
        row.appendChild(cell)
        for(const [,candidate] of result.entries()){
            cell = document.createElement("td")
            cellText = document.createTextNode(candidate.seats)
            cell.appendChild(cellText)
            row.appendChild(cell)
        }
        tblBody.appendChild(row)

        for(let i=0;i<max;i++){
            row = document.createElement("tr")
            let div = method(i)
            cell = document.createElement("td");
            cellText = document.createTextNode(div)
            cell.appendChild(cellText)
            row.appendChild(cell)
            for(const [,candidate] of result.entries()){
                cell = document.createElement("td");
                cellText = candidate.seats>i ?
                    (function(b){ b.innerText = candidate.vote/div; return b })(document.createElement("b")) :
                    document.createTextNode(candidate.vote/div)
                cell.appendChild(cellText)
                row.appendChild(cell)
            }
            tblBody.appendChild(row)
        }
        tbl.appendChild(tblBody)
        tbl.setAttribute("border", "2")
        parent.appendChild(tbl)
    }

    window.calcHAM = function(parent, seats,votes, method){
        m = eval(method)
        const result = calc(seats, votes, m)
        generate_html(parent, result, m)
    }
})()
