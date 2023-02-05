/*! dourok.info 0.0.1 - Sun Feb 05 2023 18:33:44 GMT+0000 (Coordinated Universal Time) - 🦆 */
"use strict";
(self["webpackChunkwriting"] = self["webpackChunkwriting"] || []).push([[305],{

/***/ 9774:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var d3__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(662);
/* harmony import */ var d3_scale__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(5315);
/* harmony import */ var d3_scale_chromatic__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(2096);



const D3Demo = {
  render: () => {
    const data = [4, 8, 15, 16, 23, 42];
    const x = d3__WEBPACK_IMPORTED_MODULE_0__/* .scaleLinear */ .BYU().domain([0, d3__WEBPACK_IMPORTED_MODULE_0__/* .max */ .Fp7(data)]).range([0, 100]);
    d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('.chart').selectAll('div').data(data).enter().append('div').style('width', d => `${x(d) * 10}px`).text(d => d);
  },
  renderSvg: () => {
    const data = d3__WEBPACK_IMPORTED_MODULE_0__/* .range */ .w6H(5000).map(() => Math.round(Math.random() * 5000));
    const width = 420;
    const barHeight = 20;
    const x = d3__WEBPACK_IMPORTED_MODULE_0__/* .scaleLinear */ .BYU().domain([0, d3__WEBPACK_IMPORTED_MODULE_0__/* .max */ .Fp7(data)]).range([0, 420]);
    const chart = d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('.chart').attr('width', width).attr('height', barHeight * data.length);
    const bar = chart.selectAll('g').data(data).enter().append('g').attr('transform', (d, i) => `translate(0,${i * barHeight})`);
    bar.append('rect').attr('width', x).attr('height', barHeight - 1);
    bar.append('text').attr('x', d => x(d) - 3).attr('y', barHeight / 2).attr('dy', '.35em').text(d => d);
  },
  renderCanvas: () => {
    const width = 750;
    const height = 400;
    const canvas = d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('#d3').append('canvas').attr('width', width).attr('height', height); // Add the hidden canvas and give it the 'hiddenCanvas' class.

    const hiddenCanvas = d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('#container').append('canvas').classed('hiddenCanvas', true).attr('width', width).attr('height', height);
    const context = canvas.node().getContext('2d');
    const customBase = document.createElement('custom');
    const custom = d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys(customBase);
    const groupSpacing = 4;
    const cellSpacing = 2;
    const offsetTop = height / 5;
    const cellSize = Math.floor((width - 11 * groupSpacing) / 100) - cellSpacing;

    function databind(data) {
      const colourScale = (0,d3_scale__WEBPACK_IMPORTED_MODULE_1__/* .scaleSequential */ .cJ)(d3_scale_chromatic__WEBPACK_IMPORTED_MODULE_2__/* ["default"] */ .ZP).domain(d3__WEBPACK_IMPORTED_MODULE_0__/* .extent */ .Wem(data, d => d));
      const join = custom.selectAll('custom.rect').data(data);
      const enterSel = join.enter().append('custom').attr('class', 'rect').attr('x', (d, i) => {
        const x0 = Math.floor(i / 100) % 10;
        const x1 = Math.floor(i % 10);
        return groupSpacing * x0 + (cellSpacing + cellSize) * (x1 + x0 * 10);
      }).attr('y', (d, i) => {
        const y0 = Math.floor(i / 1000);
        const y1 = Math.floor(i % 100 / 10);
        return groupSpacing * y0 + (cellSpacing + cellSize) * (y1 + y0 * 10);
      }).attr('width', 0).attr('height', 0);
      join.merge(enterSel).transition().duration(1000).attr('width', cellSize).attr('height', cellSize).attr('fillStyle', d => colourScale(d));
      const exitSel = join.exit().transition().attr('width', 0).attr('height', 0).remove();
    } // databind()


    function draw() {
      context.clearRect(0, 0, width, height); // Clear the canvas.

      const elements = custom.selectAll('custom.rect'); // Grab all elements you bound data to in the databind() function.

      elements.each(function (d, i) {
        // For each virtual/custom element...
        const node = d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys(this); // This is each individual element in the loop.

        context.fillStyle = node.attr('fillStyle'); // Here you retrieve the colour from the individual in-memory node and set the fillStyle for the canvas paint

        context.fillRect(node.attr('x'), node.attr('y'), node.attr('width'), node.attr('height')); // Here you retrieve the position of the node and apply it to the fillRect context function which will fill and paint the square.
      }); // Loop through each element.
    } // draw()


    d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('#text-input').on('keydown', function () {
      console.log(d3__WEBPACK_IMPORTED_MODULE_0__/* .event */ .Ba6);

      if (d3__WEBPACK_IMPORTED_MODULE_0__/* .event.keyCode */ .Ba6.keyCode === 13) {
        // Only do something if the user hits return (keycode 13).
        if (+this.value < 1 || +this.value > 10000) {
          // If the user goes lower than 1 or higher than 10k...
          d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('#text-explain').classed('alert', true); // ... highlight the note about the range and return.
        } else {
          // If the user types in a sensible number...
          d3__WEBPACK_IMPORTED_MODULE_0__/* .select */ .Ys('#text-explain').classed('alert', false); // ...remove potential alert colours from the note...

          const value = +this.value; // ...set the value...

          databind(d3__WEBPACK_IMPORTED_MODULE_0__/* .range */ .w6H(value));
          const t = d3__WEBPACK_IMPORTED_MODULE_0__/* .timer */ .HTH(elapsed => {
            draw();
            if (elapsed > 1050) t.stop();
          });
        } // If user hits return.

      }
    }); // Text input listener/handler
  }
};
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (D3Demo);

/***/ })

}]);