/*------------------------------------------------------------------------------
 *  Title:        node_example_core.cpp
 *  Description:  Common class functions for example talker and listener nodes.
 *----------------------------------------------------------------------------*/

/*
 *
 *      Copyright (c) 2010 <iBotics -- www.sdibotics.org>
 *      All rights reserved.
 *
 *      Redistribution and use in source and binary forms, with or without
 *      modification, are permitted provided that the following conditions are
 *      met:
 *
 *      * Redistributions of source code must retain the above copyright
 *        notice, this list of conditions and the following disclaimer.
 *      * Redistributions in binary form must reproduce the above
 *        copyright notice, this list of conditions and the following disclaimer
 *        in the documentation and/or other materials provided with the
 *        distribution.
 *      * Neither the name of the Stingray, iBotics nor the names of its
 *        contributors may be used to endorse or promote products derived from
 *        this software without specific prior written permission.
 *
 *      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *      A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *      OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *      THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include "node_example_core.h"

/*------------------------------------------------------------------------------
 * NodeExample()
 * Constructor.
 *----------------------------------------------------------------------------*/

NodeExample::NodeExample()
{
} // end NodeExample()

/*------------------------------------------------------------------------------
 * ~NodeExample()
 * Destructor.
 *----------------------------------------------------------------------------*/

NodeExample::~NodeExample()
{
} // end ~NodeExample()

/*------------------------------------------------------------------------------
 * publishMessage()
 * Publish the message.
 *----------------------------------------------------------------------------*/

void NodeExample::publishMessage(ros::Publisher *pub_message)
{
  node_example::node_example_data msg;
  msg.message = message;
  msg.a = a;
  msg.b = b;

  pub_message->publish(msg);
} // end publishMessage()

/*------------------------------------------------------------------------------
 * messageCallback()
 * Callback function for subscriber.
 *----------------------------------------------------------------------------*/

void NodeExample::messageCallback(const node_example::node_example_data::ConstPtr &msg)
{
  message = msg->message;
  a = msg->a;
  b = msg->b;

  // Note that these are only set to INFO so they will print to a terminal for example purposes.
  // Typically, they should be DEBUG.
  ROS_INFO("message is %s", message.c_str());
  ROS_INFO("sum of a + b = %d", a + b);
} // end publishCallback()

/*------------------------------------------------------------------------------
 * configCallback()
 * Callback function for dynamic reconfigure server.
 *----------------------------------------------------------------------------*/

void NodeExample::configCallback(node_example::node_example_paramsConfig &config, uint32_t level)
{
  // Set class variables to new values. They should match what is input at the dynamic reconfigure GUI.
  message = config.message.c_str();
  a = config.a;
  b = config.b;
} // end configCallback()
