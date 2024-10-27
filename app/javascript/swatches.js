class PaletteData {
    constructor(element) {
        if (element.querySelector('#palette_layout').value == "rows") {
            this._layout = "columns";
        } else if (element.querySelector('#palette_layout').value == "columns") {
            this._layout = "rows";
        } else {
            this._layout = element.querySelector('#palette_layout').value
        }
        this._spacing = element.querySelector('#palette_spacing').value;
        this._background = element.querySelector('#palette_background').value;
        this._colors = []
        element.querySelectorAll('.inkwell').forEach(inkwell => {
            this._colors.push(
                new ColorData(inkwell)
            )            
        });
    }
    get layout() {
        return this._layout;
    }
    set layout(value) {
        this._layout = value;
    }
    get spacing() {
        return this._spacing;
    }
    set spacing(value) {
        this._spacing = value;
    }
    get background() {
        return this._background;
    }
    set background(value) {
        this._background = value;
    }
    get colors() {
        return this._colors;
    }
    set colors (value) {
        this._colors = value;
    }
}
class ColorData {
    constructor(element) {
        this._hexCode = element.querySelector('input[type=color]').value;
        this._proportion = element.querySelector('input[type=number]').value;
    }
    get hexCode() {
        return this._hexCode;
    }
    set hexCode (value) {
        this._hexCode = value;
    }
    get proportion() {
        return this._proportion;
    }
    set proportion (value) {
        this._proportion = value;
    }
}
class PaletteElement {
    constructor(element) {
        this._element = element
        this._colors = []
        element.querySelectorAll('.color-swatch').forEach(swatch => {
            this._colors.push(
                new ColorElement(swatch)
            )            
        });
    }
    get element() {
        return this._element;
    }
    set element (value) {
        this._element = value;
    }
    get colors() {
        return this._colors;
    }
    set colors (value) {
        this._colors = value;
    }
    update(paletteData) {
        this.element.style.backgroundColor = paletteData.background;
        this.element.style.flexDirection = paletteData.layout;
        for (let i = 0; i < this.colors.length; i ++){
            this.colors[i].update(paletteData.colors[i], paletteData.spacing);
        }
    }
}
class ColorElement {
    constructor(element) {
        this._element = element
    }
    get element() {
        return this._element;
    }
    set element (value) {
        this._element = value;
    }
    update(colorData, spacing){
        this.element.style.margin = `${spacing / 4}rem`
        this.element.style.backgroundColor = colorData.hexCode;
        this.element.style.flexGrow = colorData.proportion;
    }
}
class Inkwell {
    constructor(element) {
        this._element = element 
    }
    get element() {
        return this._element;
    }
    set element (value) {
        this._element = value;
    }
    vanishOnRemove() {
        const removeBtn = this.element.querySelector('.delete-color-button')
        removeBtn.addEventListener('click', () => {
            this.element.style.display = 'none';
        })
    }
}
const paletteForm = document.querySelector('form');
const paletteDisplay = document.querySelector('.palette-display');
const paletteDisplayData = new PaletteData(paletteForm);
const paletteDisplayElement = new PaletteElement(paletteDisplay);
document.querySelector('h1').addEventListener('click', paletteDisplayElement.update(new PaletteData(document.querySelector('form'))));
const inkwells = Array.from(paletteForm.querySelectorAll('.inkwell'));
inkwells.forEach((inkwell, index) => { inkwells[index] = new Inkwell(inkwell)});
inkwells.forEach(inkwell => {
    inkwell.vanishOnRemove();
})