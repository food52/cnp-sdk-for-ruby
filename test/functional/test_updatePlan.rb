=begin
Copyright (c) 2017 Vantiv eCommerce

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=end
require File.expand_path("../../../lib/CnpOnline",__FILE__) 
require 'test/unit'

#test UpdatePlan Transaction
module CnpOnline
 class TestUpdatePlan < Test::Unit::TestCase
  
def test_simple_happy
    hash ={
        'merchantId' => '101',
        'version'=>'8.8',
        'id'=>'test',
        'reportGroup'=>'Planets',
        'planCode'=>'planCodeString',
        'active'=>'true'  
            }

    response= CnpOnlineRequest.new.update_plan(hash)
    assert_equal('Valid Format', response.message)
  end


  def test_simple_error
    hash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'planCode'=>'planCodeString',
	   }

    #Get exceptions
    exception = assert_raise(RuntimeError){CnpOnlineRequest.new.update_plan(hash)}
    #Test 
    assert(exception.message =~ /Error validating xml data against the schema/)
  end
 end
end
