Pf <- read.csv('pseudo_facebook.tsv', sep = '\t')
library(ggplot2)

qplot(x=friend_count,data=subset(Pf, !is.na(gender)),binwidth = 40,
      color = I('black') , fill = I('#099DD9')) +
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50)) +
  facet_wrap(~gender)

qplot(x=tenure /365,data=Pf,binwidth = 0.25,
      xlab = 'Number of years using Facebook',
      ylab = 'Number of users in the sample',
      color = I('black') , fill = I('#ff5009'))+ 
  scale_x_continuous(breaks = 1:7, limits = c(0,7))



qplot(x=www_likes, data=subset(Pf,!is.na(gender)) ,color = I('black') , fill = I('#ff5009')) + 
  facet_wrap(~gender)
 
by(Pf$www_likes,Pf$gender,sum)

qplot(data=subset(Pf,!is.na(gender)),
                  x=gender,
                  y=friend_count,geom = 'boxplot',
                ylim = c(0,250) ) 

qplot(data=subset(Pf,!is.na(gender)),
      x=gender,
      y=friend_count,geom = 'boxplot',
       ) +
  coord_cartesian(ylim = c(0,250))

ggplot(aes(x=age , y= friend_count) , data = Pf) + 
  geom_point(alpha= 1/20) + 
  xlim(13,90)


ggplot(aes(x=age , y= friend_count) , data = Pf) + 
 xlim (13,90) +
  geom_point(alpha= 0.05 , 
              position = position_jitter( h = 0 ) , 
             color = 'orange') + 
  coord_trans(y = 'sqrt') +
  geom_line(stat ='summary', fun.y = median) +
  geom_line(stat = 'summary', fun.y = mean , color = 'green' , linetype = 1 )  + 
  geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .9) , color ='blue')
  
  head(Pf)

  names(max( names(table(Pf$gender))))
 x = table(Pf$gender) == max(table(Pf$gender))



scale_x
by(Pf$friend_count,Pf$gender,summary)




