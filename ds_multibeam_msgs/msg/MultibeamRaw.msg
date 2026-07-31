# The standard 2-part DsHeader block
# This allows both a standard ROS header and DS-specific header blocks
# See HEADERS.md in ds_core_msgs for details
std_msgs/Header header
ds_core_msgs/DsHeader ds_header

# The header time should be the time the ping was transmitted, not the time the message was received.
# Note that these two could potentially be several seconds apart, especially in deep water.

# We need a number of constants to declare whether each beam is good or bad.
# This is implemented as an 8-bit masked value; its possible for more than one
# thing to flag beams as bad.  To check if a beam is good, simply
# check if its zero.

# Beam is OK
uint8 BEAM_OK = 0

# Beam is flagged as bad by the sonar.  Think hard before second-guessing
uint8 BEAM_BAD_SONAR = 1

# Beam is flagged as bad by some automated filter applied during processing.
uint8 BEAM_BAD_FILTER = 2

# Beam is flagged as bad by the user (probably not happening in realtime)
uint8 BEAD_BAD_USER = 4

# Multibeams really require a sound velocity to beamform properly.  This may
# be helpful for subsequent processing, so we include it here
float32 soundspeed

###########################################
# These arrays should have the same dimensions, and should match
# the number of beams for this sonar.
#
# Some fields are optional.  Those should have 0 length.

# Flag values for every beam
uint8[] beamflag

# Truly raw multibeam data uses travel times rather than ranges;
# we'll use the one way
# in seconds
float32[] twoway_travel_time

# Multi-sector multibeams can transmit different sectors at different times
# The Reson doesn't but we include a TX delay for each beam anyway.
#
# Overall, therefore, our overall time is:
#
# header.stamp: TX cycle starts
# Each beam's TX time: header.stamp + tx_delay[i]
# Each beam's RX time: header.stamp + tx_delay[i] + twoway_travel_time[i]
float32[] tx_delay

# Sonar-reported intensity.  Usually uncalibrated and crude
float32[] intensity

# Sonar-reported along-track steering angle (applied to tx beam)
# + forward, - aft for a downlooking sonar
# Always in radians
float32[] angle_along_track

# Sonar-reported across-track steering angle (applied to rx beam)
# + to starboard, - to port for a downlooking sonar
# Always in radians
float32[] angle_across_track

# Sonar reported -3db beamwidths
# May be empty if not reported
# Always in radians
float32[] beamwidth_along_track
float32[] beamwidth_across_track



