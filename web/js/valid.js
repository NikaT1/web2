document.addEventListener('DOMContentLoaded', function () {
    let param_x;
    let param_y;
    let param_r;

    function sendRequest(command, args) {
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
            //makeLight();
            sendRequest("color", "0");
        } else {
            //makeDark();
            sendRequest("color", "1");
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