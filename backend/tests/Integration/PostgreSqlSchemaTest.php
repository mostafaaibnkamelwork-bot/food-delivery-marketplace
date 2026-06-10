<?php

namespace Tests\Integration;

use Illuminate\Support\Facades\Schema;
use Tests\TestCase;

class PostgreSqlSchemaTest extends TestCase
{
    public function test_core_tables_exist(): void
    {
        foreach (['users','restaurants','products','orders','coupons','reviews','support_tickets','audit_logs'] as $table) {
            $this->assertTrue(Schema::hasTable($table), "Missing table: {$table}");
        }
    }
}
