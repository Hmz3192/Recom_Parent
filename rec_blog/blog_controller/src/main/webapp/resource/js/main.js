jQuery(document).ready(function($){
    var $form_modal = $('.cd-user-modal'),
        $form_login = $form_modal.find('#cd-login'),
        $form_signup = $form_modal.find('#cd-signup'),

        $form_modal_tab = $('.cd-switcher'),
        $tab_login = $form_modal_tab.children('li').eq(0).children('a'),
        $tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
        $login = $('.cd-signin'),
        $register = $('.cd-signup'),
        $tougao = $('.cd-tougao'),
        $form_forgot_password = $('.js-forget-passward'),
        $main_nav = $('.main_nav');



        $login.on('click',function (eve) {
            $form_modal.addClass('is-visible');
            login_selected()
        });
        $register.on('click',function (eve) {
            $form_modal.addClass('is-visible');
            $('#progress').css('width','50%'),
            $("#register").css('display','none'),
            $("#nextBtn").text("下一步"),
            $("#survery").css('display','block');
            signup_selected()
        });
       /* $tougao.on('click',function (eve) {
            if(user == null || user.length == 0) {
                toast("提醒","请先登录","warning");
                return false;
            }else
            {
                var bt1 = document.getElementById('button1');
                var bt2 = document.getElementById('button2');
                var bt3 = document.getElementById('button3');

                bt1.onclick = function (e) {
//            alert("1");
                    window.location.href = "${path}/Page_tocreate1.action";
                };
                bt2.onclick = function (e) {
//            alert("2");
                    window.location.href = "${path}/Page_tocreate2.action";

                };
                bt3.onclick = function (e) {
//            alert("31");
                    window.location.href = "${path}/Page_tocreate3.action";

                }
                window.location.href="http://localhost:8111/tosub"
            }

        });*/
    //弹出窗口
   /* $main_nav.on('click', function(event){

        if( $(event.target).is($main_nav) ) {
            // on mobile open the submenu
            $(this).children('ul').toggleClass('is-visible');
        } else {
            // on mobile close submenu
            $main_nav.children('ul').removeClass('is-visible');
            //show modal layer
            $form_modal.addClass('is-visible');
            if(user == null) {
                //show the selected form
                ( $(event.target).is('.cd-signup') ) ? signup_selected() : login_selected();
            }else {
                window.location.href="http://localhost:8111/tosub"
            }

        }

    });*/



    //关闭弹出窗口
    $('.cd-user-modal').on('click', function(event){
        if( $(event.target).is($form_modal) || $(event.target).is('.cd-close-form') ) {
            $form_modal.removeClass('is-visible');
        }
    });
    //使用Esc键关闭弹出窗口
    $(document).keyup(function(event){
        if(event.which=='27'){
            $form_modal.removeClass('is-visible');
        }
    });

    //切换表单
    $form_modal_tab.on('click', function(event) {
        event.preventDefault();
        ( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected();
    });

    function login_selected(){
        $form_login.addClass('is-selected');
        $form_signup.removeClass('is-selected');
        $form_forgot_password.removeClass('is-selected');
        $tab_login.addClass('selected');
        $tab_signup.removeClass('selected');
    }

    function signup_selected(){
        $form_login.removeClass('is-selected');
        $form_signup.addClass('is-selected');
        $form_forgot_password.removeClass('is-selected');
        $tab_login.removeClass('selected');
        $tab_signup.addClass('selected');
    }
});
