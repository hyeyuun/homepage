<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
</head>
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<!-- !PAGE CONTENT! -->

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

		<!-- Photo grid -->
		<div class="w3-row">
			<div class="w3-third">
				<img src="./images/aa.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
				<img src="./images/bb.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="What a beautiful scenery this sunset">
				<img src="./images/member.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="The Beach. Me. Alone. Beautiful">
			</div>

			<div class="w3-third">
				<img src="./images/dd.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="Quiet day at the beach. Cold, but beautiful"> 
				<img src="./images/ee.JPG" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="Waiting for the bus in the desert">
				<img src="./images/ff.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="Nature again.. At its finest!">
			</div>

			<div class="w3-third">
				<img src="./images/cc.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="Canoeing again"> 
				<img src="./images/cc.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="A girl, and a train passing"> 
				<img src="./images/cc.jpg" style="width: 100%; height: 450px;" onclick="onClick(this)" alt="What a beautiful day!">
			</div>
		</div>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a> 
				<a href="#" class="w3-bar-item w3-black w3-button">1</a> 
				<a href="#" class="w3-bar-item w3-button w3-hover-black">2</a> 
				<a href="#" class="w3-bar-item w3-button w3-hover-black">3</a> 
				<a href="#" class="w3-bar-item w3-button w3-hover-black">4</a> 
				<a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
			</div>
		</div>

		<!-- Modal for full size images on click-->
		<div id="modal01" class="w3-modal w3-black" style="padding-top: 0" onclick="this.style.display='none'">
			<span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
			<div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
				<img id="img01" class="w3-image">
				<p id="caption"></p>
			</div>
		</div>

		<!-- About section -->
		<div class="w3-container w3-dark-grey w3-center w3-text-light-grey w3-padding-32" id="about">
			<h4>
				<b>About Me</b>
			</h4>
			<img src="/w3images/avatar_hat.jpg" alt="Me"
				class="w3-image w3-padding-32" width="600" height="650">
			<div class="w3-content w3-justify" style="max-width: 600px">
				<h4>My Name</h4>
				<p>Some text about me. I love taking photos of PEOPLE. I am
					lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor
					incididunt ut labore et dolore magna aliqua. Ut enim ad minim
					veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
					ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
					voluptate velit esse cillum dolore eu fugiat nulla pariatur.
					Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
					officia deserunt mollit anim id est laborum consectetur adipiscing
					elit, sed do eiusmod tempor incididunt ut labore et dolore magna
					aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
					laboris nisi ut aliquip ex ea commodo consequat.</p>
				<p>mail: example@example.com</p>
				<p>tel: 5353 35531</p>
				<hr class="w3-opacity">
				<h4 class="w3-padding-16">Technical Skills</h4>
				<p class="w3-wide">Photography</p>
				<div class="w3-white">
					<div class="w3-container w3-padding-small w3-center w3-grey" style="width: 95%">95%</div>
				</div>
				<p class="w3-wide">Web Design</p>
				<div class="w3-white">
					<div class="w3-container w3-padding-small w3-center w3-grey" style="width: 85%">85%</div>
				</div>
				<p class="w3-wide">Photoshop</p>
				<div class="w3-white">
					<div class="w3-container w3-padding-small w3-center w3-grey" style="width: 80%">80%</div>
				</div>
				<p>
					<button class="w3-button w3-light-grey w3-padding-large w3-margin-top w3-margin-bottom">Download Resume</button>
				</p>
				<hr class="w3-opacity">

				<h4 class="w3-padding-16">How much I charge</h4>
				<div class="w3-row-padding" style="margin: 0 -16px">
					<div class="w3-half w3-margin-bottom">
						<ul
							class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
							<li class="w3-black w3-xlarge w3-padding-32">Basic</li>
							<li class="w3-padding-16">Web Design</li>
							<li class="w3-padding-16">Photography</li>
							<li class="w3-padding-16">5GB Storage</li>
							<li class="w3-padding-16">Mail Support</li>
							<li class="w3-padding-16">
								<h2>$ 10</h2> <span class="w3-opacity">per month</span>
							</li>
							<li class="w3-light-grey w3-padding-24">
								<button class="w3-button w3-white w3-padding-large">Sign Up</button>
							</li>
						</ul>
					</div>

					<div class="w3-half">
						<ul
							class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
							<li class="w3-black w3-xlarge w3-padding-32">Pro</li>
							<li class="w3-padding-16">Web Design</li>
							<li class="w3-padding-16">Photography</li>
							<li class="w3-padding-16">50GB Storage</li>
							<li class="w3-padding-16">Endless Support</li>
							<li class="w3-padding-16">
								<h2>$ 25</h2> <span class="w3-opacity">per month</span>
							</li>
							<li class="w3-light-grey w3-padding-24">
								<button class="w3-button w3-white w3-padding-large">Sign Up</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Contact section -->
		<div class="w3-container w3-light-grey w3-padding-32 w3-padding-large"
			id="contact">
			<div class="w3-content" style="max-width: 600px">
				<h4 class="w3-center">
					<b>Contact Me</b>
				</h4>
				<p>Do you want me to photograph you? Fill out the form and fill
					me in with the details :) I love meeting new people!</p>
				<form action="/action_page.php" target="_blank">
					<div class="w3-section">
						<label>Name</label> 
						<input class="w3-input w3-border" type="text" name="Name" required>
					</div>
					<div class="w3-section">
						<label>Email</label> 
						<input class="w3-input w3-border" type="text" name="Email" required>
					</div>
					<div class="w3-section">
						<label>Message</label> 
						<input class="w3-input w3-border" type="text" name="Message" required>
					</div>
					<button type="submit" class="w3-button w3-block w3-black w3-margin-bottom">Send Message</button>
				</form>
			</div>
		</div>

<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>