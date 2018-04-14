<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<html>
<head>
    <title>知木知管</title>

    <!--tuo zhuai-->
    <script src="${path}/src/js/js/jquery-git1.min.js" type="text/javascript"></script>
    <script src="${path}/src/js/js/jquery-sortable-lists.min.js" type="text/javascript"></script>
    <link href="${path}/src/css/style.css" rel="stylesheet">
    <script type="text/javascript">
        $(function()
        {
            var options = {
                    placeholderCss: {'background-color': '#ff8'},
                    hintCss: {'background-color':'#bbf'},
                    isAllowed: function(cEl, hint, target)
                    {
                        if(hint.parents('li').first().data('module') === 'c' && cEl.data('module') !== 'c')
                        {
                            hint.css('background-color', '#ff9999');
                            return false;
                        }
                        else
                        {
                            hint.css('background-color', '#99ff99');
                            return true;
                        }
                    },
                    opener: {
                        active: true,
                        close: 'images/Remove2.png',
                        open: 'images/Add2.png',
                        openerCss: {
                            'display': 'inline-block',
                            'width': '18px',
                            'height': '18px',
                            'float': 'left',
                            'margin-left': '-35px',
                            'margin-right': '5px',
                            'background-position': 'center center',
                            'background-repeat': 'no-repeat'
                        },
                        openerClass: ''
                    }
                },

                sWrapper = $('#settingsWrapper');

            $('#sTree2, #sTree').sortableLists(options);

            $('#toArrBtn').on('click', function(){ console.log($('#sTree2').sortableListsToArray()); });
            $('#toHierBtn').on('click', function() { console.log($('#sTree2').sortableListsToHierarchy()); });
            $('#toStrBtn').on('click', function() { console.log($('#sTree2').sortableListsToString()); });
            $('.descPicture').on('click', function(e) { $(this).toggleClass('descPictureClose'); });
        });
    </script>
</head>
<body>
<div class="container">
<section id="main_content">
    <ul class="sTree2 listsClass" id="sTree2">
        <li class="sortableListsOpen" id="item_b" data-module="b"
            style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
            <div><span class="sortableListsOpener"></span>/</div>
            <ul class="">
                <li id="item_b1" data-module="b" class="sortableListsOpen">
                    <div>data<span class="sortableListsOpener"></span></div>
                    <ul style="display: block;">
                        <li id="item_b4" data-module="b" class="sortableListsOpen"
                            style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                            <div>file1<span class="sortableListsOpener"></span></div>
                            <ul style="display: block;">
                                <li id="item_b3" data-module="b" class="sortableListsOpen"
                                    style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                                    <div>docx.docx</div>
                                </li>
                                <li id="item_b5" data-module="b" class="sortableListsOpen"
                                    style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                                    <div>jpg.jpg</div>
                                </li>
                                <li id="item_b2" data-module="b" class="sortableListsOpen"
                                    style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                                    <div>pdf.pdf</div>
                                </li>
                                <li id="item_b31" data-module="b" class="sortableListsOpen"
                                    style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                                    <div>vedio.mp4</div>
                                </li>
                                <li id="item_b42" data-module="b" class="sortableListsOpen"
                                    style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                                    <div>word.doc</div>
                                </li>
                                <li id="item_b52" data-module="b" class="sortableListsOpen"
                                    style="width: auto; position: relative; top: 0px; left: 0px; visibility: visible;">
                                    <div>xls.xls</div>
                                </li>

                            </ul>
                        </li>
                    </ul>
                </li>


            </ul>
        </li>
    </ul>

</section>
</div>


</body>
</html>
