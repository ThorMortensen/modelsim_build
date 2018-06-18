basePath = ARGV[0]
ARGV.clear

if(File.file?('build.do')) 
    puts '\'build.do\' file found!'
else 
    puts 'No \'build.do\' file in root dir.. VHDL modelsim build canceled'
    exit
end

modelsimWorkingDir = nil


puts "build started.."
buildOutPut = `exit | ~/intelFPGA_pro/17.1/modelsim_ase/bin/vsim -c -do  #{basePath}/build.do`

errorMatchExpr = /(\*\* Error: )(.*)\((.*)\)(.*)/
workdirEpxpr = /(# modelsim working dir: )(.*)/

buildOutPut.each_line do |line|
    puts line
    if (modelsimWorkingDir.nil?)
      if line.match(workdirEpxpr)
        modelsimWorkingDir = line.match(workdirEpxpr)[2]
        puts "modelsim work dir in ruby is #{modelsimWorkingDir}"
      end
    end

    if line.match(errorMatchExpr)
      errorMatch = line.match(errorMatchExpr)
      puts
      puts "+++++++++++++++++++++++++++++ CLICK HERE +++++++++++++++++++++++++++++++++++"
      puts "#{errorMatch[1]}#{modelsimWorkingDir}/#{errorMatch[2]}(#{errorMatch[3]})#{errorMatch[4]}"
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      puts
    end
end


puts "build end."




# modelsimWorkingDir = "new/dir"

# line = "# ** Error: SRC_TB/slp_top_tb.vhd(17): near \"d\": syntax error"


# if line.match(/(\*\* Error: )(.*)\((17)\)(.*syntax error)/)
#   errorMatch = line.match(/(\*\* Error: )(.*)\((17)\)(.*syntax error)/)
#   puts "Error match 0--> #{errorMatch[0]}"
#   puts "Error match 1--> #{errorMatch[1]}"
#   puts "Error match 2--> #{errorMatch[2]}"
#   puts "Error match 3--> #{errorMatch[3]}"
#   puts "Error match 4--> #{errorMatch[4]}"
#   puts "New error --> #{errorMatch[1]}#{modelsimWorkingDir}/#{errorMatch[2]}(#{errorMatch[3]})#{errorMatch[4]}"
# end