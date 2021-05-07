/*
創建Blog目錄，
id表示包含博文正文的 div 容器的 id，
mt 和 st 分別表示主標題和次級標題的標籤名稱（如 H2、H3，大寫或小寫都可以！），
interval 表示移動的速度
*/
function createBlogDirectory(id, mt, st, interval) {
    //獲取Blog正文div容器
    var elem = document.getElementById(id);
    if (!elem) return false;
    //獲取div中所有元素結點
    var nodes = elem.getElementsByTagName("*");
    //創建Blog目錄的div容器
    var divSideBar = document.createElement('DIV');
    divSideBar.className = 'uprightsideBar';
    divSideBar.setAttribute('id', 'uprightsideBar');
    var divSideBarTab = document.createElement('DIV');
    divSideBarTab.setAttribute('id', 'sideBarTab');
    divSideBar.appendChild(divSideBarTab);
    var h2 = document.createElement('H4');
    divSideBarTab.appendChild(h2);
    var txt = document.createTextNode('目錄導航');
    h2.appendChild(txt);
    var divSideBarContents = document.createElement('DIV');
    divSideBarContents.style.display = 'none';
    divSideBarContents.setAttribute('id', 'sideBarContents');
    divSideBar.appendChild(divSideBarContents);
    //創建自定義列表
    var dlist = document.createElement("dl");
    divSideBarContents.appendChild(dlist);
    var num = 0;//統計找到的mt和st
    mt = mt.toUpperCase();//轉化成大寫
    st = st.toUpperCase();//轉化成大寫
    //遍歷所有元素結點
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].nodeName == mt || nodes[i].nodeName == st) {
            //獲取標題文本
            var nodetext = nodes[i].innerHTML.replace(/<\/?[^>]+>/g, "");//innerHTML裡面的內容可能有HTML標籤，所以用正則表達式去除HTML的標籤
            nodetext = nodetext.replace(/ /ig, "");//替換掉所有的
            nodetext = htmlDecode(nodetext);
            //插入錨
            nodes[i].setAttribute("id", "blogTitle" + num);
            var item;
            switch (nodes[i].nodeName) {
                case mt:    //若為主標題
                    item = document.createElement("dt");
                    break;
                case st:    //若為子標題
                    item = document.createElement("dd");
                    break;
            }
            //創建錨鏈接
            var itemtext = document.createTextNode(nodetext);
            item.appendChild(itemtext);
            item.setAttribute("name", num);
            item.onclick = function () {        //添加鼠標點擊觸發函數
                var pos = getElementPosition(document.getElementById("blogTitle" + this.getAttribute("name")));
                if (!moveScrollBar(pos.top, interval)) return false;
            };
            //將自定義表項加入自定義列表中
            dlist.appendChild(item);
            num++;
        }
    }
    if (num == 0) return false;
    /*鼠標進入時的事件處理*/
    divSideBarTab.onmouseenter = function () {
        divSideBarContents.style.display = 'block';
    }
    /*鼠標離開時的事件處理*/
    divSideBar.onmouseleave = function () {
        divSideBarContents.style.display = 'none';
    }

    document.body.appendChild(divSideBar);
};

function htmlDecode(text) {
    var temp = document.createElement("div");
    temp.innerHTML = text;
    var output = temp.innerText || temp.textContent;
    temp = null;
    return output;
};

function getElementPosition(ele) {
    var topPosition = 0;
    var leftPosition = 0;
    while (ele) {
        topPosition += ele.offsetTop;
        leftPosition += ele.offsetLeft;
        ele = ele.offsetParent;
    }
    return {top: topPosition, left: leftPosition};
};

/*
    移動滾動條，finalPos 為目的位置，internal 為移動速度
*/
function moveScrollBar(finalpos, interval) {
    //若不支持此方法，則退出
    if (!window.scrollTo) {
        return false;
    }
    //窗體滾動時，禁用鼠標滾輪
    window.onmousewheel = function () {
        return false;
    };
    //清除計時
    if (document.body.movement) {
        clearTimeout(document.body.movement);
    }

    var currentpos = getScrollBarPosition();//獲取滾動條當前位置

    var dist = 0;
    if (currentpos == finalpos) {//到達預定位置，則解禁鼠標滾輪，並退出
        window.onmousewheel = function () {
            return true;
        }
        return true;
    }
    if (currentpos < finalpos) {//未到達，則計算下一步所要移動的距離
        dist = Math.ceil((finalpos - currentpos) / 10);
        currentpos += dist;
    }
    if (currentpos > finalpos) {
        dist = Math.ceil((currentpos - finalpos) / 10);
        currentpos -= dist;
    }
    var scrTop = getScrollBarPosition();//獲取滾動條當前位置
    window.scrollTo(0, currentpos);//移動窗口
    if (getScrollBarPosition() == scrTop)//若已到底部，則解禁鼠標滾輪，並退出
    {
        window.onmousewheel = function () {
            return true;
        }
        return true;
    }
    //進行下一步移動
    var repeat = "moveScrollBar(" + finalpos + "," + interval + ")";
    document.body.movement = setTimeout(repeat, interval);
};

/**
 * 獲取滾動條當前位置
 * @returns {number}
 */
function getScrollBarPosition() {
    var scrollBarPosition = document.body.scrollTop || document.documentElement.scrollTop;
    return scrollBarPosition;
};
