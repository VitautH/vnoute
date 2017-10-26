<div class="instagram">
	<div class="box-heading">
		<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="box-content">
		<div id="instafeed" class="clearfix"></div>
	</div>
</div>
<script type="text/javascript">
	var userFeed = new Instafeed({
		<?php if ($get == 'tagged') { ?>
			get: 'tagged',
			tagName:'<?php echo $tag_name; ?>',
			<?php } else { ?>
				get: 'user',
				userId: <?php echo $user_id; ?>,
				<?php } ?>
				accessToken: '<?php echo $accesstoken; ?>',
				limit: <?php echo $limit; ?>,
				resolution: "low_resolution",
				template: '<a href="{{link}}" class="instagram__item"> <img src="{{image}}" width="{{width}}" height="{{height}}" alt="" class="image"> </a>'
			});
	userFeed.run();
	//<div class="activities"> <span class="likes"><i class="fa fa-thumbs-o-up"></i> {{likes}}</span> <span class="comments"><i class="fa fa-comments-o"></i> {{comments}}</span> </div> <div class="location">{{location}}</div> <div class="caption">{{caption}}</div> 
</script>