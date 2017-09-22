# After do |scenario|
# 	click_link('idcta-link')
# 	click_link('Sign out')
# end

After('@login', '~@login_non_reg') do
	click_link('idcta-link')
	click_link('Sign out')
end