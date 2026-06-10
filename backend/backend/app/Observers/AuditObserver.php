<?php

namespace App\Observers;

use App\Models\AuditLog;
use Illuminate\Database\Eloquent\Model;

class AuditObserver
{
    public function created(Model $model): void { $this->record($model, 'created', [], $model->getAttributes()); }
    public function updated(Model $model): void { $this->record($model, 'updated', $model->getOriginal(), $model->getChanges()); }
    public function deleted(Model $model): void { $this->record($model, 'deleted', $model->getOriginal(), []); }

    private function record(Model $model, string $event, array $old, array $new): void
    {
        if ($model instanceof AuditLog) { return; }
        AuditLog::query()->create([
            'actor_id' => app()->bound('audit.actor_id') ? app('audit.actor_id') : null,
            'auditable_type' => $model::class,
            'auditable_id' => $model->getKey(),
            'event' => $event,
            'old_values' => $old,
            'new_values' => $new,
            'ip_address' => app()->bound('audit.ip_address') ? app('audit.ip_address') : null,
            'user_agent' => app()->bound('audit.user_agent') ? app('audit.user_agent') : null,
        ]);
    }
}
