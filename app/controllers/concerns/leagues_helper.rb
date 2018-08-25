require 'nokogiri'
require 'open-uri'

module LeaguesHelper

  def self.download(season, league_id)
    {:ranking => download_ranking(season, league_id),
     :schedule => download_schedule(season, league_id)}
  end

  def self.download_ranking(season, league_id)
    xml = Nokogiri::XML(open("https://vlw.it4sport.de/data/vbwb/aufsteiger/public/tabelle_#{season}_#{league_id}.xml"))
    ranking = []
    xml.xpath('//element').each do |element|
      rank = {}
      rank[:rank] = element.xpath('platz').text
      rank[:team] = element.xpath('team').text
      rank[:matches] = element.xpath('spiele').text
      rank[:won_sets] = element.xpath('plussaetze').text
      rank[:lost_sets] = element.xpath('minussaetze').text
      rank[:won_balls] = element.xpath('plusbaelle').text
      rank[:lost_balls] = element.xpath('minusbaelle').text
      rank[:points] = element.xpath('dppunkte').text
      rank[:won_games] = element.xpath('dpsiege').text
      rank[:lost_games] = element.xpath('dpniederlagen').text
      rank[:won_3031] = element.xpath('dpgewinn3031').text
      rank[:won_30] = element.xpath('dpgewinn30').text
      rank[:won_31] = element.xpath('dpgewinn31').text
      rank[:won_32] = element.xpath('dpgewinn32').text
      rank[:won_20] = element.xpath('dpgewinn20').text
      rank[:won_21] = element.xpath('dpgewinn21').text
      rank[:lost_1303] = element.xpath('dpniederlage1303').text
      rank[:lost_03] = element.xpath('dpniederlage03').text
      rank[:lost_13] = element.xpath('dpniederlage13').text
      rank[:lost_23] = element.xpath('dpniederlage23').text
      rank[:lost_12] = element.xpath('dpniederlage12').text
      rank[:lost_02] = element.xpath('dpniederlage02').text
      ranking.push(rank)
    end
    ranking
  end

def self.download_schedule(season, league_id)
  xml = Nokogiri::XML(open("https://vlw.it4sport.de/data/vbwb/aufsteiger/public/spielplan_#{season}_#{league_id}.xml"))
  schedule = []
  xml.xpath('//spiele/element').each do |element|
    match = {}
    match[:nr] = element.xpath('nr').text
    match[:match_day] = element.xpath('spieltag').text
    match[:date] = element.xpath('datum').text
    match[:opening_time] = element.xpath('hallenoeffnung').text
    match[:start_time] = element.xpath('spielbeginn').text
    match[:home] = element.xpath('heim').text
    match[:guest] = element.xpath('gast').text
    match[:sets_home] = element.xpath('sheim').text
    match[:sets_guest] = element.xpath('sgast').text
    match[:score] = element.xpath('result').text
    match[:location] = element.xpath('halle').text
    schedule.push(match)
  end
  schedule
end

end

