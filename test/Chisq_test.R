dat<-data.frame("Died"=c(0, 1, 2, 3, 4, 5, 6), "Days"=c(55, 144, 140, 95, 45, 15, 6))
x<-dat$Died
mu<-dat$Died %*% dat$Days / 500

dat$E_Days<-sapply(x, function(x) {(ppois(x, mu)-ppois(x-1, mu))})
dat$E_Days[7]<-(1-ppois(5, mu))
dat

layout(matrix(1:2, 1, 2))
barplot(dat$Days, main="日数", names.arg = dat$Died)
barplot(dat$E_Days, main="日数（期待値の確率密度）",names.arg = dat$Died)

chisq.test(dat$Days,p=dat$E_Days) 