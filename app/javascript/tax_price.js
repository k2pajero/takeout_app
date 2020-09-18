// window.addEventListener('load', function(){

//     let TAX = 0.1;
//     // 価格フォームに入力された数値を取得
//     const ItemPrice = document.getElementById("item-price");
//     // 「販売手数料10％（消費税額）」の要素を定義
//     const AddTaxPrice = document.getElementById("add-tax-price");
//     // 「販売利益（税抜き価格」の要素を定義
//     const Profit = document.getElementById("profit");
    
//     // 入力でイベント発火
//     ItemPrice.addEventListener('input', function(){
//     // 税込み価格に消費税率10％と残りを税抜き価格として計算
//     const price = document.getElementById("item-price").value;
//     const displayAddTaxPrice = price * TAX
//     const displayProfit = price - displayAddTaxPrice

//     const RedisplayAddTaxPrice =  Math.floor(displayAddTaxPrice)
//     const RedisplayProfit = Math.floor(displayProfit)

//     // viewのHTMLに算出した数値を送る
//     AddTaxPrice.innerHTML = RedisplayAddTaxPrice;
//     Profit.innerHTML = RedisplayProfit;
//     });
// })