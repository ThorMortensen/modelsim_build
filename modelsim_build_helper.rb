basePath = ARGV[0]
ARGV.clear

puts "starting build.."
puts "#{basePath}"
puts `exit | ~/intelFPGA_pro/17.1/modelsim_ase/bin/vsim -c -do  #{basePath}/build.do`



# modelsimWorkingDir = nil

# buildOutPut.each_line do |line|
#     puts line
#     if (modelsimWorkingDir.nil?)
#       if line.match(/(# modelsim working dir: )(.*)/)
#         modelsimWorkingDir = line.match(/(# modelsim working dir: )(.*)/)[2]
#         puts "modelsim work dir in ruby is #{modelsimWorkingDir}"
#       end
#     end
#     # if line.match(/(# modelsim working dir: )(.*)/)

#     #   puts "#{modelsimWorkingDir}"
#     # end
# end

# buildOutPut.each_line do |line|
#   puts "#{line_num += 1} #{line}"
# end



puts buildOutPut
puts "build end."