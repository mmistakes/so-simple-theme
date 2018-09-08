library(dplyr)
source("utils.R")

## import data & process it
data <- read.delim("warfarin_data.txt", header=T,na.string=".")

## relabel id to oid as original id
names(data)[1] <- "oid"

data <- transform(data, id=relabel(oid))

## baseline & dosing information
base <- subset(data, time==0 & !is.na(amt))

data <- left_join(data, base[c("oid", "amt")], by="oid", suffix=c("", "_base")) %>%
    transform(label=paste0(oid, ": ", wt, "kg, ", amt_base, "mg"))

## pk measurements, note: we allow a tlag maximum of up to 1.0 such
## that we discard here 4 observations of 0 concentration measured
## before 1h
pk <- subset(data, is.na(amt) & dvid==1 & time >= 1)

## number of observations per patient
N_pk <- rle(pk$id)$lengths
J <- max(data$id)

stan_data_pk <-list(J=J,
                    dose=base$amt,
                    N=N_pk,
                    dv=pk$dv,
                    time=pk$time,
                    weight=base$wt,
                    id=pk$id
                    )

## pd measurements
pd <- subset(data, is.na(amt) & dvid==2)

N_pd <- rle(pd$id)$lengths

stan_data_pd <- list(J=J,
                     dose=base$amt,
                     id=pd$id,
                     N=N_pd,
                     dv=pd$dv,
                     time=pd$time
                     )
