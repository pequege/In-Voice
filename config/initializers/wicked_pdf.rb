platform = RUBY_PLATFORM 

if platform.include?("darwin") # OS X machine 
  binary_path = Rails.root.join('bin', 'wkhtmltopdf-darwin-x86').to_s 
elsif platform.include?("64-linux") # 64-bit linux machine 
  binary_path = Rails.root.join('bin', 'wkhtmltopdf-linux-amd64').to_s 
else
  binary_path = Rails.root.join('bin', 'wkhtmltopdf-linux-x86').to_s 
end 

WickedPdf.config = {
  exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/wkhtmltopdf"
}
