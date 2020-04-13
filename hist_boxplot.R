library(corpora)

data(BNCbiber)
head(BNCbiber, 5)

hist(BNCbiber[,3])

# ヒストグラムのタイトルと軸ラベルを変更
hist(BNCbiber[,2], main = "past tense", xlab = "frequency", ylab = "number of texts")

# 色の変更
hist(BNCbiber[,2], main = "past tense", xlab = "frequency", ylab = "number of texts", col="grey")

# 使用できる色
colors()

# 箱ひげ図
boxplot(BNCbiber[,2], range=0)

boxplot.stats(BNCbiber[,2])

boxplot(BNCbiber[,2], range=0, main="past tense", col="gray")

