function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxCal = inputValue * 0.1
      addTaxDom.innerHTML = Math.floor( addTaxCal ) 
    const profitDom = document.getElementById("profit");
      profitDom.innerHTML = inputValue - addTaxCal
  })
};

window.addEventListener('load', item_price);
