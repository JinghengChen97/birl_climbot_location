// Generated by gencpp from file birl_module_robot/positive_solution.msg
// DO NOT EDIT!


#ifndef BIRL_MODULE_ROBOT_MESSAGE_POSITIVE_SOLUTION_H
#define BIRL_MODULE_ROBOT_MESSAGE_POSITIVE_SOLUTION_H

#include <ros/service_traits.h>


#include <birl_module_robot/positive_solutionRequest.h>
#include <birl_module_robot/positive_solutionResponse.h>


namespace birl_module_robot
{

struct positive_solution
{

typedef positive_solutionRequest Request;
typedef positive_solutionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct positive_solution
} // namespace birl_module_robot


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::birl_module_robot::positive_solution > {
  static const char* value()
  {
    return "c5997f26c5a0a6d545568596a384fa2e";
  }

  static const char* value(const ::birl_module_robot::positive_solution&) { return value(); }
};

template<>
struct DataType< ::birl_module_robot::positive_solution > {
  static const char* value()
  {
    return "birl_module_robot/positive_solution";
  }

  static const char* value(const ::birl_module_robot::positive_solution&) { return value(); }
};


// service_traits::MD5Sum< ::birl_module_robot::positive_solutionRequest> should match 
// service_traits::MD5Sum< ::birl_module_robot::positive_solution > 
template<>
struct MD5Sum< ::birl_module_robot::positive_solutionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::birl_module_robot::positive_solution >::value();
  }
  static const char* value(const ::birl_module_robot::positive_solutionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::birl_module_robot::positive_solutionRequest> should match 
// service_traits::DataType< ::birl_module_robot::positive_solution > 
template<>
struct DataType< ::birl_module_robot::positive_solutionRequest>
{
  static const char* value()
  {
    return DataType< ::birl_module_robot::positive_solution >::value();
  }
  static const char* value(const ::birl_module_robot::positive_solutionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::birl_module_robot::positive_solutionResponse> should match 
// service_traits::MD5Sum< ::birl_module_robot::positive_solution > 
template<>
struct MD5Sum< ::birl_module_robot::positive_solutionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::birl_module_robot::positive_solution >::value();
  }
  static const char* value(const ::birl_module_robot::positive_solutionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::birl_module_robot::positive_solutionResponse> should match 
// service_traits::DataType< ::birl_module_robot::positive_solution > 
template<>
struct DataType< ::birl_module_robot::positive_solutionResponse>
{
  static const char* value()
  {
    return DataType< ::birl_module_robot::positive_solution >::value();
  }
  static const char* value(const ::birl_module_robot::positive_solutionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BIRL_MODULE_ROBOT_MESSAGE_POSITIVE_SOLUTION_H