<div class="content"><!-- body Content -->
        <div class="left"><!-- Content left -->
        	<?php
				include('Modules/left/danhsach.php');
            ?>
		</div><!-- end left product -->
        <div class="right"><!-- Content Turn Right -->
        	<?php
				if(isset($_GET['xem'])){
					$tam=$_GET['xem'];
				}
				else{
				$tam='';
				}
				if($tam == 'chitietloaisanpham'){
					include('Modules/right/chitietloaisanpham.php');
				}
				if($tam == 'chitietsanpham'){
					include('Modules/right/chitietsanpham.php');
				}
				else{
					include('Modules/right/tatcasanpham.php');
				}
			?>
        </div><!-- end Content turn Right -->
        </div><!-- end Body Content -->
        
        <div class="clear"></div><!--both clear town rows -->