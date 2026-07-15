"use client";

import React from "react";
import { useAuth } from "@/lib/auth";
import { RoleTypes } from "../../config/navigation.config";
import { DashboardShell } from "../../components/navigation/DashboardShell";

export default function DashboardLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const { data: user, isLoading } = useAuth();

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gray-50 dark:bg-zinc-950 flex items-center justify-center">
        <div className="flex flex-col items-center gap-3">
          <div className="w-10 h-10 border-4 border-emerald-500 border-t-transparent rounded-full animate-spin"></div>
          <span className="text-sm font-semibold text-zinc-500 dark:text-zinc-400 animate-pulse">Memuat dashboard...</span>
        </div>
      </div>
    );
  }

  let role: RoleTypes = "mufattisy"; 

  if (user) {
    const backendRole = String(user.role).trim().toLowerCase();
    if (backendRole === "sekretariat") role = "sekretariat";
    else if (backendRole === "mufattisy") role = "mufattisy";
    else if (backendRole === "mundzir") role = "mundzir";
    else if (backendRole === "mustahiq") role = "mustahiq";
    else if (backendRole === "petugas keamanan") role = "keamanan";
    else if (backendRole === "wali santri") role = "wali_santri";
  }

  return (
    <DashboardShell role={role}>
      {children}
    </DashboardShell>
  );
}
