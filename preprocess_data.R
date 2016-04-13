setwd('~/Code/ML/HW7')
loc_data<-read.csv('loc_data.txt', header=T, sep=" ")
coords = loc_data[c(1,7,8)]

temp_data<-read.csv('temp_data.txt', header=T, sep=" ")
temps = temp_data[c(1,4,6)]

n = dim(coords[1])
n_years = 5

avg_temp = array(0,dim=c(n))
base_year = 1999

for (i in 1:n) {
  sid = coords$SID[i]
  year_temps = array(9999,dim=c(n_years))
  for (j in c(1:n_years)) {
    all_days = temps$Tmin_deg_C[which(temps$SID == sid & temps$Year == base_year + j)]
    if (length(all_days[which(all_days != 9999)]) > 0) {
      year_temps[j] = min(all_days[which(all_days != 9999)])
    }
  }
  avg_temp[sid] = mean(year_temps[which(year_temps != 9999)])
}
coords = cbind(coords,avg_temp)
View(coords)
