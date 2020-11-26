window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  //販売価格をpriceInput.valueで取得→変数inputValueに代入//
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    //Math.floor(inputValue * 0.1)の計算結果で販売手数料
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = Math.floor(inputValue * 0.9);
  });
});
