class BbcHomepage

	include PageObject

	page_url 'https://www.bbc.co.uk/'
	
	link(:sign_in_link, :id => 'idcta-link')	


end