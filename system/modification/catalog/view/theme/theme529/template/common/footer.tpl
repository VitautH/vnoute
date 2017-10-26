<div class="footer-box">
    <footer>
        <div class="container">
            <div class="row">
                <div <?php if ($footer_top) { ?>class="col-sm-12"<?php } ?>>
                    <div class="footer">
                        <div class="footer-boxes">
                            <?php if ($informations) { ?>
                                <div class="footer_box">
                                    <h5><?php echo $text_information; ?></h5>
                                    <ul class="list-unstyled">
                                        <?php foreach ($informations as $information) { ?>
                                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            <?php } ?>
                            <div class="footer_box">
                                <h5><?php echo $text_service; ?></h5>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                    <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                                </ul>
                            </div>
                            <div class="footer_box">
                                <h5><?php echo $text_extra; ?></h5>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                                    <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                                    <!--<li><a href="<?php // echo $affiliate; ?>"><?php // echo $text_affiliate; ?></a></li>-->
                                    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                                </ul>
                            </div>
                            <div class="footer_box">
                                <h5><?php echo $text_account; ?></h5>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                    <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                                </ul>
                            </div>
                            
                    <div class="footer_box">
                        <div class="box-1">
                                <?php if (!empty($first_code) && !empty($first_phone)){ ?>
                                <p><small><?php echo $first_code;?></small> <?php echo $first_phone;?></p>
                                <?php } ?>
                                <?php if (!empty($second_code) && !empty($second_phone)){ ?>
                                <p><small><?php echo $second_code;?></small> <?php echo $second_phone;?></p>
                                <?php } ?>
                        </div>
                        <div class="box-2">
                            <?php if (!empty($first_wtday) && !empty($first_wttime)){ ?>
                            <p><small><?php echo $first_wtday; ?></small> <?php echo $first_wttime; ?></p>
                            <?php } ?>
                            <?php if (!empty($second_wtday) && !empty($second_wttime)){ ?>
                            <p><small><?php echo $second_wtday; ?></small> <?php echo $second_wttime; ?></p>
                            <?php } ?>
                        </div>
                    </div>
                
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-xs-12 col-md-8">
                                <div class="legal-info">
                                    <?php echo $comment; ?>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-4 footer_mark">
                                <p class="copyright-space"> Сайт разработан <noindex><a target="_blank" href="http://www.pamconsult.by" rel="nofollow"><img src="/image/mark.png" alt="">PamConsult</a></noindex></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 			<div class="col-sm-4">
                                                <a href="https://vk.com/slomalby" target="blank"><img src="http://slomal.pamconsult.by/image/vk-slomalby.jpg"></a>
                                        </div> -->
                <?php if ($footer_top) { ?>
                    <div class="col-sm-4 hidden">
                        <div class="footer_top">
                            <?php if ($maintenance == 0) { ?>
                                <?php echo $footer_top; ?>
                            <?php } ?>
                        </div> 
                    </div>
                <?php } ?> 
            </div>

        </div>
    </footer>
</div>
<script src="catalog/view/theme/theme529/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/tm-stick-up.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/jquery.unveil.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/jquery.bxslider/jquery.bxslider.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/fancybox/jquery.fancybox.js"></script>
<script src="catalog/view/theme/theme529/js/elavatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/superfish.js" type="text/javascript"></script>
<!--video script-->
<script src="catalog/view/theme/theme529/js/jquery.vide.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/jquery.touchSwipe.min.js" type="text/javascript"></script>
<!--Green Sock-->
<script src="catalog/view/theme/theme529/js/greensock/jquery.gsap.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/greensock/TimelineMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/greensock/TweenMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/greensock/jquery.scrollmagic.min.js" type="text/javascript"></script>
<!--photo swipe-->
<script src="catalog/view/theme/theme529/js/photo-swipe/klass.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/photo-swipe/code.photoswipe.jquery-3.0.5.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/photo-swipe/code.photoswipe-3.0.5.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/jquery-match-height/dist/jquery.matchHeight-min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/pamconsult.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/script.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme529/js/livesearch.js" type="text/javascript"></script>
</div>
</body></html>