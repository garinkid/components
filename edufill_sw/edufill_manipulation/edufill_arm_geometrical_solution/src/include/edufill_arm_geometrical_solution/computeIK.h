#include <iostream>
#include <assert.h>
#include <cmath>

#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>
#include <boost/units/systems/si/length.hpp>
#include <boost/units/systems/si/plane_angle.hpp>
#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>

#include <Eigen/Geometry>
#include "/usr/include/eigen3/Eigen/src/Geometry/Quaternion.h"
#include "/usr/include/eigen3/Eigen/src/Core/Matrix.h"

#include <yb_simple_iks/computeIK.h>

Eigen::VectorXf solve_ik(Eigen::Matrix3f goalR, Eigen::Vector3f goalT, int sol_index);
