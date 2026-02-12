usage=$(amdgpu_top -gm | grep average_gfx_activity | head -1 | awk '{print $2}')
usage=${usage:0:-1}
echo $usage
