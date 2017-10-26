<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
            <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <?php if ($icon) { ?>
            <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
            <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="catalog/view/theme/theme529/js/site-inp-number.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href='//fonts.googleapis.com/css?family=Roboto:400,300,500,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet"  href="catalog/view/theme/theme529/js/fancybox/jquery.fancybox.css" media="screen" />
        <link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
        <link href="catalog/view/theme/theme529/stylesheet/livesearch.css" rel="stylesheet">
        <link href="catalog/view/theme/theme529/stylesheet/photoswipe.css" rel="stylesheet">
        <link href="catalog/view/theme/theme529/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
        <link href="catalog/view/theme/theme529/stylesheet/stylesheet.css" rel="stylesheet">
        <link href="catalog/view/theme/theme529/stylesheet/superfish.css" rel="stylesheet">
        <link href="catalog/view/theme/theme529/stylesheet/responsive.css" rel="stylesheet">
        <?php foreach ($styles as $style) { ?>
            <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>


        <!--custom script-->
        <?php foreach ($scripts as $script) { ?>
            <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
<!--[if lt IE 9]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]--> 
        <?php echo $google_analytics; ?>
    </head>
    <body class="<?php echo $class; ?>">
        <!-- Modal -->
        <div id="callback" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Заказ звонка</h4>
                    </div>
                    <div class="modal-body">
                        <form id="cbform" action="">
                            <div class="form-group">
                                <h2 class="text-center">Заполните форму и наш специалист свяжется с вами в течение 30 минут</h2>
                                <label class="control-label" for="cb-name">Ваше имя</label>
                                <input type="text" name="cb_name" class="form-control" id="cb-name">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="cb-phone">Ваш номер телефона:</label>
                                <input type="text" name="cb_phone" class="form-control" id="cb-phone">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="cb-message">Текст сообщения:</label>
                                <textarea name="cb_message" rows="3" class="form-control" id="cb-message"></textarea>
                                <span class="help-block"></span>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-block" id="sendcb">Отправить</button>
                    </div>
                </div>

            </div>
        </div>
        <script>
            $(function () {
                $("#sendcb").click(function () {
                    var that = $(this);
                    var formdata = $("#cbform").serialize();
                    var errors = false;
                    if ($("#cb-phone").val().length < 5) {
                        errors = true;
                        $("#cb-phone").parent().removeClass('has-success').addClass('has-error').find('.help-block').text('Введите корректный номер телефона');
                    } else {
                        $("#cb-phone").parent().removeClass('has-error').addClass('has-success').find('.help-block').text('');
                    }
                    if ($("#cb-name").val().length < 2) {
                        errors = true;
                        $("#cb-name").parent().removeClass('has-success').addClass('has-error').find('.help-block').text('Представьтесь');
                    } else {
                        $("#cb-name").parent().removeClass('has-error').addClass('has-success').find('.help-block').text('');
                    }
                    if (errors == false) {
                        $.ajax({
                            url: '/index.php?route=information/contact/callback',
                            type: 'POST',
                            data: formdata,
                            beforeSend: function () {
                                $(that).addClass('cb-sending').text('Идёт отправка...');
                            },
                            success: function () {
                                $(that).parent().html('Ваше сообщение было успешно отправлено.');
                            }
                        })
                    }

                })
            })
        </script>
        <!-- swipe menu -->
        <div class="swipe">
            <div class="swipe-menu">
                <ul>
                    <li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
                    <?php if ($logged) { ?>
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                        <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                    <?php } else { ?>
                        <li><a href="<?php echo $register; ?>"><i class="fa fa-user"></i> <?php echo $text_register; ?></a></li>
                        <li><a href="<?php echo $login; ?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a></li>
                    <?php } ?>
                    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total2" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
                    <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a></li>
                    <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
                </ul>
                <?php if ($maintenance == 0) { ?>
                    <ul class="foot">
                        <?php if ($informations) { ?>
                            <?php foreach ($informations as $information) { ?>
                                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                <?php } ?>
                <ul class="foot foot-1">
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                </ul>

                <ul class="foot foot-2">
                    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                    <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                </ul>
                <ul class="foot foot-3">
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>
        </div>
        <div id="page">
            <div class="shadow"></div>
            <div class="toprow-1">
                <a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
            </div>

            <div class="top-box">
                <div class="container">
                    <nav id="top" class="clearfix">
                        <?php echo $currency; ?>
                        <?php echo $language; ?>
                        <div id="top-links" class="nav pull-left">
                            <ul class="list-inline">
                                <?php foreach ($informations as $information) { ?>
                                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                                <?php } ?>
                                <!--<li><a href="<?php // echo $affiliate; ?>">Партнерам</a></li>-->
                                <li><a href="<?php echo $contact; ?>">Контакты</a></li>				
                                <!-- 					
                                <li class="first"><a href="<?php echo $home; ?>"><i class="fa fa-home hidden-lg hidden-md"></i><span class="hidden-sm"><?php echo $text_home; ?></span></a></li>
                                <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user hidden-lg hidden-md"></i> <span class="hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span></a>		
                                        <ul class="dropdown-menu dropdown-menu-left">
                                <?php if ($logged) { ?>
                                                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                <?php } else { ?>
                                                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                <?php } ?>
                                        </ul> 
                                </li>					
                                <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart hidden-lg hidden-md"></i> <span class="hidden-sm"><?php echo $text_wishlist; ?></span></a></li>
                                <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart hidden-lg hidden-md"></i> <span class="hidden-sm"><?php echo $text_shopping_cart; ?></span></a></li>
                                <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share hidden-lg hidden-md"></i> <span class="hidden-sm"><?php echo $text_checkout; ?></span></a></li> 
                                -->
                            </ul>
                        </div>
                    </nav>

                    <div class="login-box">
                        <?php if ($logged) { ?>
                            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                        <?php } else { ?>

                            <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>&nbsp;/&nbsp;
                            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
                        <?php } ?>
                    </div>

                    <?php echo $cart; ?>

                    <div class="order-phone-box">
                        <a href="#" onclick="return false;" data-toggle="modal" data-target="#callback"><i></i>Заказать звонок</a>
                    </div>
                </div>
            </div>

            <header>
                <div class="container">
                    <div class="header clearfix">

                        <div id="logo">
                            <?php if ($logo) { ?>
                                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                            <?php } else { ?>
                                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                            <?php } ?>
                        </div>

                        <div class="header-social">
                            <a href="https://vk.com/slomalby" class="vk" target="_blank" title="vk"></a>
                            <a href="https://www.instagram.com/slomal.by/" class="inst" target="_blank" title="инстаграм"></a>  
                        </div>

                        <?php echo $search; ?>

                        <div class="contacts-header-box">
                            <div class="grid grid-50 box-1">
                                <p><small>8 (029)</small> 654 21 35</p>
                                <p><small>8 (029)</small> 654 21 35</p>
                            </div>
                            <div class="grid grid-50 box-2">
                                <p><small>Пн-Пт</small> 10:00-20:00</p>
                                <p><small>Сб-Вс</small> 10:00-18:00</p>
                            </div>
                        </div>
                    </div>
                </div>
                <?php if ($categories) { ?>
                    <div class="container">
                        <div id="menu-gadget">
                            <div id="menu-icon"><?php echo $text_category; ?></div>
                            <?php
                            if ($categories) {
                                echo $categories;
                            }
                            ?>
                        </div>
                    </div>
                <?php } ?>
                <?php if ($categories) { ?>
                    <div id="tm_menu" class="nav__primary">
                        <div class="container">
                            <div class="menu-shadow">
                                <?php
                                if ($categories) {
                                    echo $categories;
                                }
                                ?>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </header>
            <p id="back-top"> <a href="#top"><span></span></a> </p>

