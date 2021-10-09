<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/valid.js"></script>
    <style>
        body {
            color: #6d747f;
            font-size: 26px;
            font-family: "Open Sans", cursive;
            background-color: #FFEBCD;
        }

        .dark-body {
            color: #d6c4e0;
            font-size: 26px;
            font-family: "Open Sans", cursive;
            background-color: rgba(81, 51, 94, 0.73);
        }

        table {
            margin: auto;
            padding: 10px;
            border-radius: 10px;
            border-spacing: 10px;
            table-layout: auto;
        }

        #body-table {
            table-layout: fixed;
        }

        #imagine {
            width: 210px;
            height: 210px;
        }

        input[type='radio'] {
            padding: 7%;
            margin: 7%;
        }

        input[type='text'] {
            font-family: cursive;
            display: inline-block;
        }

        #name-table {
            width: 100%;
            border-spacing: 7px;
        }

        .name-table {
            background-color: #dab6ea;
        }

        .variant-table {
            background-color: #f1d2ff;
        }

        .dark-name-table {
            background-color: rgba(79, 50, 91, 0.73);
        }

        .dark-variant-table {
            background-color: rgba(119, 83, 140, 0.73);
        }

        #head-table {
            width: 100%;
            border-spacing: 0;
        }

        #body-table {
            font-size: 20px;
            margin: auto;
            height: 550px;
        }

        .body-table {
            background-color: #f1d2ff;
        }

        .dark-body-table {
            background-color: rgba(81, 51, 94, 0.73);
        }

        #numbers-table {
            padding: 0;
            margin: 0;
            width: 80%;
        }

        #variant-table {
            width: 90%;
            font-size: 20px;
            margin: auto;
            border-spacing: 5px;
        }

        .background-with-shadow {
            background-image: url("images/picture1.jpg");
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            box-shadow: 0 0 8px 8px #f1d2ff inset;
        }

        .background {
            background: rgba(255, 240, 245, 0.45);
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            border-radius: 10px;
        }

        .background-with-dark-shadow {
            background-image: url("images/dark-picture1.jpg");
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            box-shadow: 0 0 8px 8px #51455d inset;
        }

        .dark-background {
            background: rgba(97, 62, 114, 0.73);
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            border-radius: 10px;
        }

        select {
            width: 165px;
        }

        .numbers {
            text-align: center;
            vertical-align: middle;
        }

        .button {
            font-family: cursive;
            font-weight: 700;
            text-decoration: none;
            padding: .8em 1em calc(.8em + 3px);
            border-radius: 3px;
            background: rgba(217, 182, 252, 0.76);
            box-shadow: 0 -3px rgba(217, 182, 252, 0.76) inset;
            transition: 0.2s;
        }

        .button:hover {
            background: rgba(163, 113, 196, 0.73);
        }

        .button:active {
            outline: none;
            background: rgba(163, 113, 196, 0.73);
            box-shadow: 0 3px rgba(163, 113, 196, 0.73) inset;
        }

        .result-style tbody td {
            border-collapse: collapse;
            border: 4px solid rgba(217, 185, 230, 0.6);
            font-size: 20px;
        }

        .result-style tbody th {
            border-collapse: collapse;
            border: 4px solid rgba(217, 185, 230, 0.6);
            font-size: 20px;
        }

        .errorY {
            border-color: red;
            background-color: rgba(234, 111, 145, 0.97);
        }


        .imagine3 {
            width: 210px;
            height: 210px;
        }

        .dark-imagine3 {
            width: 160px;
            height: 120px;
        }

        #result-table::first-line {
            text-transform: uppercase;
            font-weight: bold;
        }

        #result-table {
            border-collapse: collapse;
            text-align: center;
            border: 4px solid rgba(217, 185, 230, 0.6);
            font-size: 20px;
        }

        #r-table {
            padding: 0;
            margin: 0;
            table-layout: fixed;
        }

        #selectY {
            font-family: cursive;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 6px rgba(206, 91, 238, 0.49);
        }

        ::-webkit-scrollbar-thumb {
            box-shadow: inset 0 0 6px rgba(206, 91, 238, 0.49);
        }

        #result-div {
            overflow-x: auto;
            height: 300px;
            width: 100%;
        }

        .coord {
            stroke: rgb(122, 3, 171);
            fill: rgb(122, 3, 171);
        }

        .dark-coord {
            stroke: rgb(255, 255, 255);
            fill: rgb(255, 255, 255);
        }

        #result-td {
            width: 50%;
        }

        .svg-line-color {
            stroke: rgb(104, 90, 110);
        }

        .svg-figure-color {
            fill: rgb(234, 234, 234);
            stroke: rgb(161, 133, 171);
        }

        .dark-svg-line-color {
            stroke: rgb(193, 162, 203);
        }

        .dark-svg-figure-color {
            fill: rgba(79, 50, 91, 0.73);
            stroke: rgba(186, 129, 255, 0.73);
        }

        .dark-svg-text {
            stroke: rgb(214, 196, 224);
            fill: rgb(214, 196, 224);
        }

    </style>
    <title>First lab</title>
    <meta charset="utf-8"/>
</head>
<body>
<table id="main-table">
    <tr>
        <td>
            <table id="head-table">
                <tr>
                    <td>
                        <table id="name-table" class="name-table">
                            <tr>
                                <td>Тройникова Вероника Дмитриевна, группа Р3233</td>
                                <td>
                                    <button class="button" id="changeColor">
                                        сменить тему
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="variant-table" class="variant-table">
                            <tr>
                                <td>
                                    <div>Вариант 33333</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table id="body-table" class="body-table">
                <tr class="background-with-shadow" id="background-tr">
                    <td>
                        <table class="background" id="background-table">
                            <tr>
                                <td>
                                    <svg width="210" height="210" xmlns="http://www.w3.org/2000/svg">
                                        <polygon points="60,100 100,140 100,100" class="svg-figure-color"
                                                 stroke-width="2"></polygon>
                                        <polygon points="100,20 180,20 180,100 100,100" class="svg-figure-color"
                                                 stroke-width="2"></polygon>
                                        <path d="M100,100 v-80 a80,80 0 0,0-80,80z" class="svg-figure-color"
                                              stroke-width="2"></path>
                                        <line x1="100" y1="0" x2="100" y2="200" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="0" y1="100" x2="200" y2="100" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="97" y1="60" x2="103" y2="60" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="97" y1="20" x2="103" y2="20" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="97" y1="140" x2="103" y2="140" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="97" y1="180" x2="103" y2="180" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="60" y1="97" x2="60" y2="103" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="20" y1="97" x2="20" y2="103" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="140" y1="97" x2="140" y2="103" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="180" y1="97" x2="180" y2="103" stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="100" y1="0" x2="95" y2=10 stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="100" y1="0" x2="105" y2=10 stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="200" y1="100" x2="190" y2=105 stroke-width="2"
                                              class="svg-line-color"></line>
                                        <line x1="200" y1="100" x2="190" y2=95 stroke-width="2"
                                              class="svg-line-color"></line>
                                        <text x="30" y="92" font-size="15" class="svg-text">-R/2</text>
                                        <text x="6" y="92" font-size="15" class="svg-text">-R</text>
                                        <text x="107" y="30" font-size="15" class="svg-text">R/2</text>
                                        <text x="107" y="70" font-size="15" class="svg-text">R</text>
                                        <text x="110" y="10" font-size="15" class="svg-text">y</text>
                                        <text x="130" y="92" font-size="15" class="svg-text">R/2</text>
                                        <text x="170" y="92" font-size="15" class="svg-text">R</text>
                                        <text x="190" y="92" font-size="15" class="svg-text">x</text>
                                        <text x="107" y="140" font-size="15" class="svg-text">-R/2</text>
                                        <text x="107" y="180" font-size="15" class="svg-text">-R</text>
                                        <circle id="coord" class="coord" r="3" cx="110" cy="90"></circle>
                                    </svg>
                                </td>
                                <td>
                                    <img id="imagine3" class="imagine3" src="images/pic3.png" alt="Милый хомячок"/>
                                </td>
                                <td rowspan="2" class="background" id="result-td">
                                    <div id="result-div">
                                        <table id="result-table" class="result-style">
                                            <tr>
                                                <th id="real-time" class="result-style">Текущее время</th>
                                                <th id="time" class="result-style">Время исполнения</th>
                                                <th id="X" class="result-style">X</th>
                                                <th id="Y" class="result-style">Y</th>
                                                <th id="R" class="result-style">R</th>
                                                <th id="flag" class="result-style">Результат</th>
                                            </tr>
                                            <tr>
                                                <td><%=session.getAttribute("TimeLast")%></td>
                                                <td><%=session.getAttribute("TimeLast")%></td>
                                                <td><%=session.getAttribute("xLast")%></td>
                                                <td><%=session.getAttribute("yLast")%></td>
                                                <td><%=session.getAttribute("rLast")%></td>
                                                <td><%=session.getAttribute("resultLast")%></td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table id="numbers-table" class="background">
                                        <tr>
                                            <td>X:</td>
                                            <td>
                                                <input type="text" id="inputX" maxlength="17" autocomplete="off"
                                                       placeholder="Введите число: (-5; 5)">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Y:</td>
                                            <td ><select size="1" id="selectY" autofocus>
                                                <option value="-2" autofocus>-2</option>
                                                <option value="-1.5">-1.5</option>
                                                <option value="-1">-1</option>
                                                <option value="-0.5">-0.5</option>
                                                <option value="0">0</option>
                                                <option value="0.5">0.5</option>
                                                <option value="1">1</option>
                                                <option value="1.5">1.5</option>
                                                <option value="2">2</option>
                                            </select>
                                            </td>
                                        </tr>
                                        <tr class="numbers">
                                            <td>R:</td>
                                            <td>
                                                <table id="r-table">
                                                    <tr>
                                                        <td>
                                                            <label> <input name="rCheckBox" id="defaultBox" type="checkbox"
                                                                           value="1"
                                                                           checked>
                                                                <p>1</p>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <label>
                                                                <input name="rCheckBox" type="checkbox" value="1.5">
                                                                <p>1.5</p>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <label>
                                                                <input name="rCheckBox" type="checkbox" value="2">
                                                                <p>2</p>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <label>
                                                                <input name="rCheckBox" type="checkbox" value="2.5">
                                                                <p>2.5</p>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <label>
                                                                <input name="rCheckBox" type="checkbox" value="3">
                                                                <p>3</p>
                                                            </label>
                                                        </td>
                                                        <td colspan="2">
                                                            <button class="button" id="submit">
                                                                результат
                                                            </button>
                                                        </td>
                                                        <td colspan="3">
                                                            <button class="button" id="reset">
                                                                очистить
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
