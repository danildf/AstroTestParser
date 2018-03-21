require 'rubygems'
require 'mechanize'
agent = Mechanize.new
puts 'Print the test number(1-8):'
test = gets.chomp.to_i
case test
when 1
  num = 47
when 2
  num = 29
when 3
  num = 27
when 4
  num = 58
when 5
  num = 27
when 6
  num = 34
when 7
  num = 29
when 8
  num = 22
end
cnt = 1
hash = {}



until cnt == num
  puts cnt
  q = agent.get("http://college.ru/astronomy/course/content/chapter"+test.to_s+"/test"+cnt.to_s+".html").search("p[align^='justify']").to_s
  19.times do
    q[0] = ''
  end
  5.times do
    q[q.length-1] = ''
  end
  q.gsub!("<nobr>", "")
  q.gsub!("</nobr>", "")
  q.gsub!("<sup>", "")
  q.gsub!("</sup>", "")
  q.gsub!("<br>", "")
  q = q[0].to_s + q[1].to_s + q[2].to_s + q[3].to_s + q[4].to_s + q[5].to_s + q[6].to_s + q[7].to_s
  l = agent.get("http://college.ru/astronomy/course/content/chapter"+test.to_s+"/test"+cnt.to_s+".html").search("tr")
  ans_a = []
  l.each do |a|
    if a.to_s.include? 'false'
      ans_a.push a.to_s
	  270.times do
		ans_a.last[0] = ''
	  end
	  20.times do
		ans_a.last[ans_a.last.length-1] = ''
	  end
	  ans_a.last.gsub!("<nobr>", "")
	  ans_a.last.gsub!("</nobr>", "")
	  ans_a.last.gsub!("<sup>", "")
	  ans_a.last.gsub!("</sup>", "")
	  ans_a.last.gsub!("<br>", "")
	  ans_a.last.gsub!("\n", "")
	  ans_a.last.gsub!('<span class="m">', "")
	  ans_a.last.gsub!("</span>", "")
	  ans_a.last.gsub!(";", "")
	  ans_a.last.gsub!("obr>", "")
    end
  end
  l.each do |a|
    if a.to_s.include? 'true'
      ans_a.push a.to_s
	  270.times do
		ans_a.last[0] = ''
	  end
	  20.times do
		ans_a.last[ans_a.last.length-1] = ''
	  end
	  ans_a.last.gsub!("<nobr>", "")
	  ans_a.last.gsub!("</nobr>", "")
	  ans_a.last.gsub!("<sup>", "")
	  ans_a.last.gsub!("</sup>", "")
	  ans_a.last.gsub!("<br>", "")
	  ans_a.last.gsub!("\n", "")
	  ans_a.last.gsub!('<span class="m">', "")
	  ans_a.last.gsub!("</span>", "")
	  ans_a.last.gsub!(";", "")
	  ans_a.last.gsub!("obr>", "")
    end
  end

  stp = false
  puts ans_a[3]
  until stp == true
	if ans_a[3][0] == ans_a[0][0] || ans_a[3][0] == ans_a[1][0] || ans_a[3][0] == ans_a[2][0]
	  ans_a.each do |a|
	    a[0] = ''
		if ans_a.last.length < 3
		  puts '========ALLERT!========'
		  stp = true
		  break
		end
	  end
	else
	  until ans_a.last.length <= 8
		ans_a.last[ans_a.last.length-1] = ''
	  end
	  stp = true
	end
  end

  hash[q] = ans_a.last.to_s
  cnt += 1
end
hash = hash.sort

f = File.new('test_'+test.to_s+'_results.txt', 'a+')
File.open('test_'+test.to_s+'_results.txt','w') do |s|
  s.puts hash
end