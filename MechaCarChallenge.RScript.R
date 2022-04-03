library(dplyr)
Mecha_table <- read.csv(file= 'MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)
lm(mpg~ vehicle_length+ vehicle_weight+ spoiler_angle+ ground_clearance+ AWD, data= Mecha_table)
summary(lm(mpg~ vehicle_length+ vehicle_weight+ spoiler_angle+ ground_clearance+ AWD, data= Mecha_table)) #Summary Statistics

Suspension_table <- read.csv(file= 'Suspension_Coil.csv', check.names=F, stringsAsFactors = F)
totalsummary <- Suspension_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary table
lot_summary <- Suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create lot summary table
t.test(Suspension_table$PSI, mu=mean (Suspension_table$PSI)) #Perform one sample t-test
t.test(subset(Suspension_table, Manufacturing_Lot == 'Lot1')$PSI, mu=mean(Suspension_table$PSI))
t.test(subset(Suspension_table, Manufacturing_Lot == 'Lot2')$PSI, mu=mean(Suspension_table$PSI))
t.test(subset(Suspension_table, Manufacturing_Lot == 'Lot3')$PSI, mu=mean(Suspension_table$PSI))
