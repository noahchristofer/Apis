

        <!--**********************************

            Footer start

        ***********************************-->

        <div class="footer">

            <div class="copyright">

                <p>Copyright © Designed &amp; Developed by <a href="http://utecho.com/" target="_blank">Utecho</a> 2021</p>

            </div>

        </div>

        <!--**********************************

            Footer end

        ***********************************-->



		<!--**********************************

           Support ticket button start

        ***********************************-->



        <!--**********************************

           Support ticket button end

        ***********************************-->





    </div>

    <!--**********************************

        Main wrapper end

    ***********************************-->



    <!--**********************************

        Scripts

    ***********************************-->

    <!-- Required vendors -->
<script src="https://kit.fontawesome.com/a0c361a166.js"></script>
    <script src="vendor/global/global.min.js"></script>

	<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

	<script src="vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="js/custom.min.js"></script>

	<script src="js/deznav-init.js"></script>

	<script src="vendor/owl-carousel/owl.carousel.js"></script>		

	

	<!-- Chart piety plugin files -->

    <script src="vendor/peity/jquery.peity.min.js"></script>

	

	<!-- Apex Chart -->

	<script src="vendor/apexchart/apexchart.js"></script>

	

	<!-- Dashboard 1 -->

	<script src="js/dashboard/dashboard-1.js"></script>

	<!-- Datatable -->

    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>

    <script src="js/plugins-init/datatables.init.js"></script>



	<script>

		function carouselReview(){

			/*  testimonial one function by = owl.carousel.js */

			/*  testimonial one function by = owl.carousel.js */

			jQuery('.testimonial-one').owlCarousel({

				loop:true,

				margin:10,

				nav:false,

				center:true,

				dots: false,

				navText: ['<i class="fa fa-caret-left"></i>', '<i class="fa fa-caret-right"></i>'],

				responsive:{

					0:{

						items:2

					},

					400:{

						items:3

					},	

					700:{

						items:5

					},	

					991:{

						items:6

					},			

					

					1200:{

						items:4

					},

					1600:{

						items:5

					}

				}

			})	

		}

		

		jQuery(window).on('load',function(){

			setTimeout(function(){

				carouselReview();

			}, 1000); 

		});

	</script>

</body>

</html>