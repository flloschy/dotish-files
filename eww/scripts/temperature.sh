# AMD CPUs only give one value, not per core
sensor="k10temp-pci-00c3"
# Tccd1 is apparently the raw measurement value of AMD CPUs
zone="Tccd1"
temperature=$(sensors $sensor | grep $zone | awk '{print $2}')
# remove "+" and "°C"
temperature=${temperature:1:-2}
# remove floating value
temperature=$(printf "%.0f" "$temperature")
echo $temperature
