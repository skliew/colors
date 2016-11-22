$(document).ready(() => {
    ['1', '2', '3'].forEach((n) => {
        const selectN = `#select${n}`;
        const divN = `#div${n}`;
        $(selectN).append($('<option>', { selected: 'None', text: 'Select color'}));
        $(divN).css('width', '33%');
        $(divN).css('height', '100%');
        $(divN).css('float', 'left');
        colors.forEach((color) => {
            $(selectN).append($('<option>', { value: color, text: color }));
        });
        $(selectN).change(() => {
            $(divN).removeClass();
            const value = $(`${selectN} option:selected`).text();
            $(divN).addClass(`c${value}`);
        });
    });
});
