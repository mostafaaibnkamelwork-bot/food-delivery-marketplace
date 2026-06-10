<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuditContext
{
    public function handle(Request $request, Closure $next)
    {
        app()->instance('audit.actor_id', $request->user()?->id);
        app()->instance('audit.ip_address', $request->ip());
        app()->instance('audit.user_agent', $request->userAgent());
        return $next($request);
    }
}
