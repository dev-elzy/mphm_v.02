"use client";

import { motion } from "framer-motion";
import { Wrench } from "lucide-react";

export function MaintenanceScreen() {
  return (
    <div className="min-h-screen bg-zinc-950 flex flex-col items-center justify-center p-6 text-center">
      <motion.div
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        className="max-w-md w-full bg-zinc-900 border border-zinc-800 rounded-3xl p-8 shadow-2xl flex flex-col items-center gap-6"
      >
        <div className="w-20 h-20 bg-blue-500/10 rounded-full flex items-center justify-center">
          <Wrench className="w-10 h-10 text-blue-500" />
        </div>
        
        <div className="space-y-3">
          <h1 className="text-2xl font-bold text-white tracking-tight">Sistem Sedang Diperbarui</h1>
          <p className="text-zinc-400 text-sm leading-relaxed">
            Mohon maaf, saat ini sedang dilakukan pemeliharaan dan pembaruan rutin pada sistem Manajemen Pesantren. Silakan coba beberapa saat lagi.
          </p>
        </div>

        <div className="w-full h-1 bg-zinc-800 rounded-full overflow-hidden mt-2">
          <motion.div 
            className="h-full bg-blue-500"
            initial={{ width: "0%" }}
            animate={{ width: "100%" }}
            transition={{ duration: 2, repeat: Infinity, ease: "linear" }}
          />
        </div>
      </motion.div>
    </div>
  );
}
