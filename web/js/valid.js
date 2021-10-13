document.addEventListener('DOMContentLoaded', function () {
    let param_x;
    let param_y;
    let param_r;
    let timeZone = new Date();

    function sendRequest(command, args) {
        alert(args);
        $.ajax({
            type: 'GET',
            url: 'controller',
            data: {
                "command": command,
                "args": args
            },
            success: function () {
                window.location.href = '/docker-dir/index.jsp';
            },
            error: function () {
                alert("Проверка на Сервер не прошла");
            }
        });
    }

    function makeLight() {
        document.querySelector("body").classList.remove('dark-body');
        document.querySelector("#background-tr").classList.remove('background-with-dark-shadow');
        document.querySelector("#background-table").classList.remove('dark-background');
        document.querySelector("#numbers-table").classList.remove('dark-background');
        document.querySelector("#result-td").classList.remove('dark-background');
        document.querySelector("#variant-table").classList.remove('dark-variant-table');
        document.querySelector("#name-table").classList.remove('dark-name-table');
        document.querySelector("#body-table").classList.remove('dark-body-table');
        document.getElementById("imagine3").src = "images/pic3.png";
        document.querySelector("#imagine3").classList.remove("dark-imagine3");
        document.querySelectorAll("line").forEach(line => line.classList.remove("dark-svg-line-color"));
        document.querySelector("path").classList.remove("dark-svg-figure-color");
        document.querySelector(".coord").classList.remove("dark-coord");
        document.querySelectorAll("text").forEach(text => text.classList.remove("dark-svg-text"));
        document.querySelectorAll("polygon").forEach(polygon => polygon.classList.remove("dark-svg-figure-color"));
    }

    function makeDark() {
        document.querySelector("body").classList.add('dark-body');
        document.querySelector("tr[class='background-with-shadow']").classList.add('background-with-dark-shadow');
        document.querySelectorAll("table[class='background']").forEach(table => table.classList.add('dark-background'));
        document.querySelector("td[class='background']").classList.add('dark-background');
        document.querySelector("#variant-table").classList.add('dark-variant-table');
        document.querySelector("#name-table").classList.add('dark-name-table');
        document.querySelector("#body-table").classList.add('dark-body-table');
        document.getElementById("imagine3").src = "images/dark-pic3.png";
        document.querySelector("#imagine3").classList.add("dark-imagine3");
        document.querySelector("path").classList.add("dark-svg-figure-color");
        document.querySelector(".coord").classList.add("dark-coord");
        document.querySelectorAll("line").forEach(line => line.classList.add("dark-svg-line-color"));
        document.querySelectorAll("text").forEach(text => text.classList.add("dark-svg-text"));
        document.querySelectorAll("polygon").forEach(polygon => polygon.classList.add("dark-svg-figure-color"));
    }

    document.querySelectorAll('input[name="rCheckBox"]').forEach(x => x.addEventListener("change", (function () {
                if (x.checked) {
                    let boxes = document.querySelectorAll('input[name="rCheckBox"]');
                    for (let box of boxes) {
                        if (x.value != box.value) {
                            box.checked = false;
                        }
                    }
                } else x.checked = true;
            }
        )
        )
    );

    document.querySelector("input[type=text]").addEventListener('focus', function (e) {
        e.preventDefault();
        document.querySelector('#inputX').classList.remove('errorY');
    });
    document.querySelector("#reset").addEventListener('click', function (e) {
        e.preventDefault();
        clear();
        sendRequest("clear", "");
    });

    function clear() {
        document.getElementById('result-table').getElementsByTagName("tbody")[0].innerHTML = document.getElementById("result-table").rows[0].innerHTML;
        document.getElementById("inputX").value = "";
        document.querySelector("#inputX").classList.remove('errorY');
        document.querySelectorAll('input[name="rCheckBox"]').forEach(x => x.checked = false);
        document.getElementById('defaultBox').checked = true;
        document.getElementById('selectY').selectedIndex = 0;
    }

    document.querySelector('#changeColor').addEventListener('click', function (e) {
        e.preventDefault();
        if (document.querySelector("body").classList.contains('dark-body')) {
            makeLight();
            sendRequest("color", "false");
        } else {
            makeDark();
            sendRequest("color", "true");
        }
    });

    document.querySelector("svg").addEventListener('mousedown', function (e) {
        if (checkR()) {
            param_x = (e.offsetX - 100) / 80 * param_r;
            param_y = (100 - e.offsetY) / 80 * param_r;
            sendRequestWithArgs();
        } else {
            alert('Не выбран радиус R!');
        }
    })

    function sendRequestWithArgs() {
        $.ajax({
            type: 'GET',
            url: 'controller',
            data: {
                'x': param_x,
                'y': param_y,
                'r': param_r,
                'time': timeZone.getTimezoneOffset()
            },
            success: function () {
                window.location.href = '/docker-dir/index.jsp';
            },
            error: function () {
                alert("Проверка на Сервер не прошла");
            }
        });
    }

    document.querySelectorAll('input[name="rCheckBox"]').forEach(r => r.addEventListener('change', function () {
        let x, y;
        checkR();
        document.querySelectorAll('circle').forEach(point => {
            x = point.getAttribute('data-x');
            y = point.getAttribute('data-y');
            r = point.getAttribute('data-r');
            x = 80 * x / param_r + 100;
            y = -80 * y / param_r + 100;
            if (r == param_r && point.classList.contains('old-coord')) {
                point.classList.remove("old-coord");
                point.classList.add("coord");
            } else if (r != param_r && point.classList.contains("coord")) {
                point.classList.add("old-coord");
                point.classList.remove("coord");
            }
            point.setAttribute('cx', x + 'px');
            point.setAttribute('cy', y + 'px');
        });
    }))

    function checkR() {
        let boxes = document.querySelectorAll('input[name="rCheckBox"]');
        for (let elem in boxes) {
            if (boxes[elem].checked)
                param_r = boxes[elem].value;
        }
        return true;
    }

    document.querySelector("#submit").addEventListener('click', function (e) {
        e.preventDefault();

        function checkX() {
            let line = document.querySelector("#inputX").value;
            line = line.replace(",", ".");
            let regex = /^[-]?[0-9]{1,17}([.][0-9]{1,17}|[0-9]{0,17})$/;
            let OK = regex.exec(line);
            let x = parseFloat(line);
            const MAX = 5;
            const MIN = -5;
            if (!isNaN(x) && x > MIN && x < MAX && OK) {
                param_x = x;
                document.querySelector('#inputX').classList.remove('errorY');
                return true;
            } else {
                return false;
            }
        }

        function checkY() {
            let select = document.getElementById('selectY');
            param_y = select.options[select.selectedIndex].value;
            return true;
        }

        if (checkY() && checkX() && checkR()) {
            sendRequestWithArgs();
        } else {
            document.querySelector('#inputX').classList.add('errorY');
        }
    })
});