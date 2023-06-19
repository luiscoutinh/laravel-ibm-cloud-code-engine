<?php
 
namespace App\Http\Middleware;
 
use Illuminate\Http\Middleware\TrustProxies as Middleware;
use Illuminate\Http\Request;
 
class TrustProxies extends Middleware
{
    /**
     * The trusted proxies for this application.
     *
     * This list is available at https://cloud.ibm.com/docs/cis?topic=cis-cis-allowlisted-ip-addresses.
     *
     * If this list of IP's is changed, you should receive a notification in your IBM Cloud Account.
     *
     * @var string|array
     */
    protected $proxies = [
        '173.245.48.0',
        '103.21.244.0',
        '103.22.200.0',
        '103.31.4.0',
        '141.101.64.0',
        '108.162.192.0',
        '190.93.240.0',
        '188.114.96.0',
        '197.234.240.0',
        '198.41.128.0',
        '162.158.0.0',
        '104.16.0.0',
        '104.24.0.0',
        '172.64.0.0',
        '131.0.72.0',
    ];
 
    /**
     * The headers that should be used to detect proxies.
     *
     * @var int
     */
    protected $headers = Request::HEADER_X_FORWARDED_FOR | Request::HEADER_X_FORWARDED_HOST | Request::HEADER_X_FORWARDED_PORT | Request::HEADER_X_FORWARDED_PROTO;
}
